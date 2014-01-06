require "spec_helper"

describe BookFetcher do
  it "retrieves books from a given office" do
    Book.should_receive(:where).with(office: "poa").and_return(double("a collection of books"))
    BookFetcher.find_by_office("POA")
  end
end
