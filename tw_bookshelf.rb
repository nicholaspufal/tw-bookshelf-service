Mongoid.load!("config/mongoid.yml")
Dir[File.expand_path("../app/**/*.rb",__FILE__)].each { |file| require file }
Dir[File.expand_path("../lib/**/*.rb",__FILE__)].each { |file| require file }

use Rack::Cache, verbose: false

before do
  cache_control :public, :max_age => 3600
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Content-Type"] = "application/json"
end

get '/books/:office_name' do
  books = BookFetcher.find_by_office(params["office_name"])
  books.to_json
end
