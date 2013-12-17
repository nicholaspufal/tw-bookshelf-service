require "spec_helper"
require "json"

describe "service return all the books" do
  it "GET /books" do
    expected_json = {
      "title"           => "30 anos de Enduro da Indepêndencia",
      "copies"          => 1,
      "who_is_reading"  => nil,
      "owner"  =>  "Bruno Tavares",
      "waiting_list"    =>  nil,
      "location"        => "@TW",
      "comments"        => nil
    }

    get "/books"
  
    JSON.parse(last_response.body).first.should == expected_json
  end
end
