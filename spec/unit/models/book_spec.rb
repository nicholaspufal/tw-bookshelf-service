require "spec_helper"

describe Book do
  let(:book_values) do 
    { 
      title:          "The Art of Agile Development", 
      owner:          "Nicholas Pufal", 
      copies:         2, 
      location:       "@TW", 
      waiting_list:   "Foolano, Beltrano", 
      who_is_reading: "Foolano, Beltrano", 
      comments:       "Lorem ipsum dolor ses main dolo.",
      cover:          "http://covers.com/randomcover",
      office:         "poa"
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
    book.office = book_values[:office]
    book
  end

  it { should have_fields(:title, :owner, :copies, :location, :comments, :waiting_list, :who_is_reading, :cover, :office) }

  it "is serializable" do
    book.to_json.should == "{\"title\":\"The Art of Agile Development\",\"owner\":\"Nicholas Pufal\",\"copies\":2,\"location\":\"@TW\",\"comments\":\"Lorem ipsum dolor ses main dolo.\",\"waiting_list\":\"Foolano, Beltrano\",\"who_is_reading\":\"Foolano, Beltrano\",\"cover\":\"http://covers.com/randomcover\",\"office\":\"poa\"}"
  end
end
