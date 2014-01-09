require "spec_helper"

describe "service return all the books" do
  it "GET /books/POA" do
    expected_json = {
      "title"           => "",
      "copies"          => 0,
      "who_is_reading"  => nil,
      "owner"           => "Lourenço Soares",
      "waiting_list"    => nil,
      "location"        => "@TW",
      "comments"        => nil,
      "cover"           => "http://bks2.books.google.com.br/books?id=bvB1-MmhEjQC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
      "office"          => "poa"
    }

    get "/books/poa"
  
    JSON.parse(last_response.body).first.should == expected_json
  end

  it "GET /books/Recife" do
    expected_json = {
      "title"           => "A Cabeca de Steve Jobs",
      "copies"          => 1,
      "who_is_reading"  => nil,
      "owner"           => "Henrique R R",
      "waiting_list"    => nil,
      "location"        => "@TW",
      "comments"        => nil,
      "cover"           => "http://bks1.books.google.com.br/books?id=ebMc469Ai68C&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
      "office"          => "recife"
    }

    get "/books/recife"
  
    JSON.parse(last_response.body).first.should == expected_json
  end
end
