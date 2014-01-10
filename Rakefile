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
