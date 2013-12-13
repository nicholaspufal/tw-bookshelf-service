require "rack/test"
require_relative '../tw_bookshelf.rb'
Dir[File.expand_path("../../lib/**/*.rb",__FILE__)].each { |file| require file }
Dir[File.expand_path("../../app/**/*.rb",__FILE__)].each { |file| require file }

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include RSpecMixin

  config.order = 'random'
end
