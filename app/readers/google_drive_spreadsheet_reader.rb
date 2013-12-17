require "google_drive"

class GoogleDriveSpreadsheetReader
  def initialize(config)
    @config = config
  end

  def get_books(tab = "POA")
    spreadsheet = create_session.spreadsheet_by_key(@config.key)
    cells = spreadsheet.worksheet_by_title(tab)

    cells.rows.collect do |row| 
      next if row[0] == "cce"
      BookFactory.generate_book(row)
    end
  end

  private 

  def create_session
    GoogleDrive.login(@config.username, @config.password)
  end
end
