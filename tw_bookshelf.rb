Mongoid.load!("config/mongoid.yml")
Dir[File.expand_path("../app/**/*.rb",__FILE__)].each { |file| require file }
Dir[File.expand_path("../lib/**/*.rb",__FILE__)].each { |file| require file }

get '/books/:office_name' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  config = ConfigLoader.new("config/config.yml")
  books = BookFetcher.find_by_office(params["office_name"])
  books.to_json
end
