class BookFactory
  class << self
    def generate_book(row, office_name)
        title           = row[0]
        copies          = row[1]
        who_is_reading  = row[2]
        owner           = row[3]
        waiting_list    = row[4]
        location        = row[5]
        comments        = row[6]

        book = Book.new
        book.title = title
        book.copies = copies.to_i
        book.owner = owner
        book.location = default_for(location)
        book.comments = default_for(comments)
        book.who_is_reading = default_for(who_is_reading)
        book.waiting_list = default_for(waiting_list)
        book.office = office_name
        book
    end

    private

    def default_for(value)
      value.empty? ? nil : value
    end
  end
end
