require "spec_helper"

describe BookCoverFetcher do
  let(:some_book) { double("a book").as_null_object } 
  let(:another_book) { double("other book").as_null_object } 

  it "searchs for a cover by the given title, using only the first result" do
    GoogleBooks.should_receive(:search).with("intitle:Some random book", api_key: "a1b2c3").and_return([some_book, another_book])

    BookCoverFetcher.find_by_title("Some random book", "a1b2c3").should == some_book
  end

  it "returns the cover thumbnail with the zoom level set to 1" do
    GoogleBooks.stub(:search).and_return([some_book, another_book])
    some_book.should_receive(:image_link).with(hash_including(zoom: 1))

    BookCoverFetcher.find_by_title("Some random book", "a1b2c3")
  end

  it "doesn't try to return the cover thumbnail if there is no book returned" do
    GoogleBooks.stub(:search).and_return([])

    BookCoverFetcher.find_by_title("Some random book", "a1b2c3").should == nil
  end
end
