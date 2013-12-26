require "spec_helper"

describe BookCoverFetcher do
  let(:config) { double("a interpreted config file", google_books_api_key: "foobar1234").as_null_object }
  let(:some_book) { double("a book").as_null_object } 
  let(:another_book) { double("other book").as_null_object } 
  let(:book_cover_fetcher)  { BookCoverFetcher.new(config) }  

  it "searchs for a cover by the given title, using only the first result" do
    GoogleBooks.should_receive(:search).with("intitle:Some random book", api_key: config.google_books_api_key).and_return([some_book, another_book])

    book_cover_fetcher.find_by_title("Some random book").should == some_book
  end

  it "returns the cover thumbnail with the zoom level set to 1" do
    GoogleBooks.stub(:search).and_return([some_book, another_book])
    some_book.should_receive(:image_link).with(hash_including(zoom: 1))

    book_cover_fetcher.find_by_title("Some random book")
  end

  it "doesn't try to return the cover thumbnail if there is no book returned" do
    GoogleBooks.stub(:search).and_return([])

    book_cover_fetcher.find_by_title("Some random book").should == nil
  end
end
