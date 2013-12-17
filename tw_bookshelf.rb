require "sinatra"
require "json"
Dir[File.expand_path("../app/**/*.rb",__FILE__)].each { |file| require file }
Dir[File.expand_path("../lib/**/*.rb",__FILE__)].each { |file| require file }

get '/books/:tab_name' do
  config = ConfigLoader.new("config/config.yml")
  reader = GoogleDriveSpreadsheetReader.new(config)
  books = reader.get_books(params["tab_name"])
  books.compact.collect(&:serialize).to_json
end
