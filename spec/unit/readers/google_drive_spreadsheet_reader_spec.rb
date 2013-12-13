require "spec_helper"

describe GoogleDriveSpreadsheetReader do
  let(:config) { double("a interpreted config file", username: "foo", password: "bar", key: "0AsVBDHxiMgLbdEtXVG5wNUwyLVVYYTY2NEVxUzRmVlE") }
  let(:google_drive_gem) { double("the gem to communicate with google drive") }
  let(:reader) { GoogleDriveSpreadsheetReader.new(config, google_drive_gem) }

  it "connects to Google Drive using the configuration values" do
    session = double("the session").as_null_object

    google_drive_gem.should_receive(:login).with("foo", "bar").and_return(session)
    session.should_receive(:spreadsheet_by_key).with("0AsVBDHxiMgLbdEtXVG5wNUwyLVVYYTY2NEVxUzRmVlE")

    reader.get_books
  end

  it "capture the rows from a given tab" do
    session = double("the session")
    spreadsheet = double("the spreadsheet")

    google_drive_gem.stub(:login).and_return(session)
    session.stub(:spreadsheet_by_key).and_return(spreadsheet)

    spreadsheet.should_receive(:workbook_by_title).with("POA")

    reader.get_books("POA")
  end

  xit "instantiates a Book for each one coming from the spreadsheet" do
  end
end
