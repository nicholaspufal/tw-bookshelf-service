class BookSpreadsheetFetcher
  def initialize(config)
    @config = config
  end

  def get_books(tab = "POA")
    spreadsheet = create_session.spreadsheet_by_key(@config.spreadsheet_key)
    cells = spreadsheet.worksheet_by_title(tab)
    office_name = tab.downcase

    cells.rows[1..-1].collect do |row| 
      BookFactory.generate_book(row, office_name)
    end
  end

  private 

  def create_session
    GoogleDrive.login(@config.username, @config.password)
  end
end
