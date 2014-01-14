require "bundler"
Bundler.require
Mongoid.load!("config/mongoid.yml")
config_file = File.open('config/config.yml')
Dir[File.expand_path("../app/**/*.rb",__FILE__)].each { |file| require file }
Dir[File.expand_path("../lib/**/*.rb",__FILE__)].each { |file| require file }

task :default do
  puts "No default behavior defined yet"
end

desc "Tries to find a book cover from GoogleBooks using only the books that are missing it"
task :update_book_covers do
  config = ConfigLoader.new(config_file)
  puts "Searching covers for books that don't have it yet..."
  books_with_no_cover = Book.where(cover: nil)
  books_with_no_cover.each do |book|
    cover_image = BookCoverFetcher.find_by_title(book.title, config.google_books_api_key)
    unless cover_image.nil?
      book.update_attribute(:cover, cover_image) unless cover_image.nil?
      puts "Updated cover in book: {title: #{book.title}, owner: #{book.owner}, copies: #{book.copies}}"
    end
  end
  puts "Task finished."
end

# temporary task, until we create the endpoints in the service and can get rid of the spreadsheet
desc "Make a check for books added/updated in the spreadsheet and send it to MongoDB if changes are detected"
task :sync_books do
  config = ConfigLoader.new(config_file)
  puts "Searching for new/updated books in the spreadsheet..."
  spreadsheet = BookSpreadsheetFetcher.new(config)
  books_poa = spreadsheet.get_books("POA")
  books_recife = spreadsheet.get_books("Recife")
  books = books_poa + books_recife

  books.each do |book| 
    db_book = Book.where(title: book.title, office: book.office).first
    if db_book.present? && book_changed?(book, db_book)
      Book.where(title: book.title, office: book.office)
          .update(
            copies:         book.copies,
            waiting_list:   book.waiting_list,
            owner:          book.owner,
            location:       book.location,
            who_is_reading: book.who_is_reading,
            comments:       book.comments,
          )
      puts "Book updated: {title: #{book.title}, office: #{book.office}, owner: #{book.owner}, copies: #{book.copies}, waiting_list: #{book.waiting_list}}"
    elsif !db_book.present?
      Book.create(
        title:          book.title,
        copies:         book.copies,
        waiting_list:   book.waiting_list,
        owner:          book.owner,
        location:       book.location,
        who_is_reading: book.who_is_reading,
        cover:          book.cover,
        comments:       book.comments,
        office:         book.office
      )
      puts "New book added: {title: #{book.title}, office: #{book.office}, owner: #{book.owner}, copies: #{book.copies}, waiting_list: #{book.waiting_list}}"
    end
  end

  puts "Task finished."
end

def book_changed?(spreadsheet_book, db_book)
  fields = db_book.fields.keys - %w(_id _type cover office)

  fields.each do |field|
    return true if spreadsheet_book.send(field) != db_book.send(field)
  end

  return false
end
