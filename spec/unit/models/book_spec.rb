require "spec_helper"

describe Book do
  let(:book_values) do 
    { 
      title: "The Art of Agile Development", 
      owner: "Nicholas Pufal", 
      copies: 2, 
      location: "@TW", 
      waiting_list: "Foolano, Beltrano", 
      who_is_reading: "Foolano, Beltrano", 
      comments: "Lorem ipsum dolor ses main dolo.",
      cover: "http://covers.com/randomcover"
    }
  end

  let(:book) do
    book = Book.new
    book.title = book_values[:title]
    book.owner = book_values[:owner]
    book.copies = book_values[:copies]
    book.location = book_values[:location]
    book.comments = book_values[:comments]
    book.waiting_list = book_values[:waiting_list]
    book.who_is_reading = book_values[:who_is_reading]
    book.cover = book_values[:cover]
    book
  end

  it "has a basic book structure" do
    book.title.should == book_values[:title]
    book.owner.should == book_values[:owner]
    book.copies.should == book_values[:copies]
    book.location.should == book_values[:location]
    book.comments.should == book_values[:comments]
    book.waiting_list.should == book_values[:waiting_list]
    book.who_is_reading.should == book_values[:who_is_reading]
    book.cover.should == book_values[:cover]
  end

  it "is serializable" do
    book.to_json.should == "{\"title\":\"The Art of Agile Development\",\"owner\":\"Nicholas Pufal\",\"copies\":2,\"location\":\"@TW\",\"comments\":\"Lorem ipsum dolor ses main dolo.\",\"waiting_list\":\"Foolano, Beltrano\",\"who_is_reading\":\"Foolano, Beltrano\",\"cover\":\"http://covers.com/randomcover\"}"
  end
end
