require "spec_helper"

describe GoogleDriveSpreadsheetFetcher do
  let(:config) { double("a interpreted config file", username: "foo", password: "bar", key: "0AsVBDHxiMgLbdEtXVG5wNUwyLVVYYTY2NEVxUzRmVlE") }
  let(:reader) { GoogleDriveSpreadsheetFetcher.new(config) }

  context "session not opened yet" do
    it "connects to Google Drive using the configuration values" do
      session = double("the session").as_null_object

      GoogleDrive.should_receive(:login).with("foo", "bar").and_return(session)
      session.should_receive(:spreadsheet_by_key).with("0AsVBDHxiMgLbdEtXVG5wNUwyLVVYYTY2NEVxUzRmVlE")

      reader.get_books
    end
  end

  context "session opened" do
    let(:session) { double("the session") }
    let(:spreadsheet) { double("the spreadsheet").as_null_object }

    before(:each) do 
      GoogleDrive.stub(:login).and_return(session)
      session.stub(:spreadsheet_by_key).and_return(spreadsheet)
    end

    it "returns the cells from a given tab" do
      spreadsheet.should_receive(:worksheet_by_title).with("Recife")
      reader.get_books("Recife")
    end

    it "ignores the first row and delegates to BookFactory each of the other rows" do
      first_row = ["Title", "Copies", "Who is reading?", "Original Owner", "Waiting list", "@TW/With owner", "Comments"]
      second_row = ["Designing Social Interfaces (o'reilly | yahoo press)", "1", "Élvio V.", "Pedro Pimentel", "", "@TW", "Saiu da TW e levou o livro"]
      third_row = ["Other book", "3", "Luis Pereira", "Foolano", "", "with the owner", "Random notes"]

      spreadsheet.stub(:rows).and_return([first_row, second_row, third_row])

      BookFactory.should_receive(:generate_book).with(second_row)
      BookFactory.should_receive(:generate_book).with(third_row)

      books = reader.get_books
    end
  end
end
