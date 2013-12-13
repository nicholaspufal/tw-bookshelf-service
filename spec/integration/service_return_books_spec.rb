require "spec_helper"

describe "service return all the books" do
  it "GET /books" do
    expected_json = {
      title: "Agile Testing: How to Succeed in an Extreme Testing Environment" 
    }

    get "/books"
  
    last_response.body.should == hash_including(expected_json)
  end
end
