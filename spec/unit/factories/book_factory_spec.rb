require "spec_helper"

describe BookFactory do 
  let(:config) { double("a config file").as_null_object }
  let(:book_factory) { BookFactory.new(config) }
  let(:row) do
    ["Designing Social Interfaces (o'reilly | yahoo press)", 
     "1", 
     "Élvio V.", 
     "Pedro Pimentel", 
     "", 
     "@TW", 
     "Saiu da TW e levou o livro"]
  end

  it "instantiates a Book based on the given row" do
    BookCoverFetcher.any_instance.should_receive(:find_by_title).and_return("http://google.com/randomimage.jpg")

    book = Book.new
    book.title = "Designing Social Interfaces (o'reilly | yahoo press)"
    book.copies = 1
    book.owner = "Pedro Pimentel"
    book.location = "@TW"
    book.comments = "Saiu da TW e levou o livro"
    book.waiting_list = nil
    book.who_is_reading = "Élvio V."
    book.cover = "http://google.com/randomimage.jpg"

    book_factory.generate_book(row).should be_same_book_as(book)
  end
end
