class BookCoverFetcher
  def initialize(config)
    @config = config
  end

  def find_by_title(title)
    book = GoogleBooks.search("intitle:#{title}", api_key: @config.google_books_api_key).first
    book.image_link(zoom: 1) unless book.nil?
  end
end
