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

desc "Make a check for new books added to the spreadsheet and add them to the service database"
task :add_new_books do
  config = ConfigLoader.new(config_file)
  puts "Searching for new books in the spreadsheet..."
  spreadsheet = BookSpreadsheetFetcher.new(config)
  books_poa = spreadsheet.get_books("POA")
  books_recife = spreadsheet.get_books("Recife")
  books = books_poa + books_recife

  books.each do |book| 
    unless Book.where(title: book.title).exists?
      Book.create(
        title:          book.title,
        copies:         book.copies,
        waiting_list:   book.waiting_list,
        owner:          book.owner,
        location:       book.location,
        who_is_reading: book.who_is_reading,
        cover:          book.cover,
        cooments:       book.comments,
        office:         book.office
      )
      puts "New book found and added: {title: #{book.title}, owner: #{book.owner}, copies: #{book.copies}, waiting_list: #{book.waiting_list}}"
    end
  end
  puts "Task finished."
end
