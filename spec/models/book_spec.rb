require "spec_helper"

describe Book do
  it "has a basic book structure" do
    title = "The Art of Agile Development"
    owner = "Nicholas Pufal"
    copies = 2
    location = "@TW"
    comments = <<-DOC
      Lorem ipsum dolor ses main dolo.
    DOC

    book = Book.new
    book.title = title
    book.owner = owner
    book.copies = copies
    book.location = location
    book.comments = comments

    book.title.should == title
    book.owner.should == owner
    book.copies.should == copies
    book.location.should == location
    book.comments.should == comments
  end
end
