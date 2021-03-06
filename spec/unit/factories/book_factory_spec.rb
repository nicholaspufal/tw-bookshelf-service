require "spec_helper"

describe BookFactory do 
  it "instantiates a Book based on the given row" do
    row = ["Designing Social Interfaces (o'reilly | yahoo press)", "1", "Élvio V.", "Pedro Pimentel", "", "@TW", "Saiu da TW e levou o livro"]
    office_name = "recife"
    
    book = Book.new
    book.title = "Designing Social Interfaces (o'reilly | yahoo press)"
    book.copies = 1
    book.owner = "Pedro Pimentel"
    book.location = "@TW"
    book.comments = "Saiu da TW e levou o livro"
    book.waiting_list = nil
    book.who_is_reading = "Élvio V."
    book.office = office_name

    BookFactory.generate_book(row, office_name).should be_same_book_as(book)
  end
end
