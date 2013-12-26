require "sinatra"
Dir[File.expand_path("../app/**/*.rb",__FILE__)].each { |file| require file }
Dir[File.expand_path("../lib/**/*.rb",__FILE__)].each { |file| require file }

get '/books/:tab_name' do
  config = ConfigLoader.new("config/config.yml")
  book_factory = BookFactory.new(config)
  reader = GoogleDriveSpreadsheetFetcher.new(config, book_factory)
  books = reader.get_books(params["tab_name"])
  books.to_json
end
