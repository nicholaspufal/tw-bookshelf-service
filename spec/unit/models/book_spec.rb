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
      comments: <<-DOC
        Lorem ipsum dolor ses main dolo.
      DOC
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
  end

  it "is serializable" do
    book.serialize.should == { 
      title:          book_values[:title],
      owner:          book_values[:owner],
      copies:         book_values[:copies],
      location:       book_values[:location],
      comments:       book_values[:comments],
      waiting_list:   book_values[:waiting_list],
      who_is_reading: book_values[:who_is_reading]
    }
  end
end
