class BookCoverFetcher
  def self.find_by_title(title, api_key)
    book = GoogleBooks.search("intitle:#{title}", api_key: api_key).first
    book.image_link(zoom: 1) unless book.nil?
  end
end
