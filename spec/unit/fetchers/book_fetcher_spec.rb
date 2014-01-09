require "spec_helper"

describe BookFetcher do
  it "retrieves books from a given office" do
    Book.should_receive(:where).with(office: "poa").and_return(double("a collection of books").as_null_object)

    BookFetcher.find_by_office("POA")
  end

  it "sorts the books by title" do
    books = double("a collection of books")
    Book.stub(:where).and_return(books)
    books.should_receive(:order_by).with("title ASC")

    BookFetcher.find_by_office("POA")
  end
end
