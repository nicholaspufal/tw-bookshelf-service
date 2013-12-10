require "spec_helper"

describe Book do
  it "has a basic book structure" do
    book_name = "The Art of Agile Development"
    original_owner = "Nicholas Pufal"

    book = Book.new(book_name, original_owner)
    book.title.should == book_name
    book.original_owner.should == original_owner
  end
end
