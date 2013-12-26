class BookFactory
  def initialize(config)
    @config = config
    @book_cover_fetcher ||= BookCoverFetcher.new(config)
  end

  def generate_book(row)
    row_attributes      = attributes_per_row(row)

    book                = Book.new
    book.title          = row_attributes[:title]
    book.copies         = row_attributes[:copies].to_i
    book.owner          = row_attributes[:owner]
    book.location       = default_for(row_attributes[:location])
    book.comments       = default_for(row_attributes[:comments])
    book.who_is_reading = default_for(row_attributes[:who_is_reading])
    book.waiting_list   = default_for(row_attributes[:waiting_list])
    book.cover          = @book_cover_fetcher.find_by_title(book.title) 
    book
  end

  private

  def default_for(value)
    value.empty? ? nil : value
  end

  def attributes_per_row(row)
    {
      title:          row[0],
      copies:         row[1],
      who_is_reading: row[2],
      owner:          row[3],
      waiting_list:   row[4],
      location:       row[5],
      comments:       row[6]
    }.freeze
  end
end
