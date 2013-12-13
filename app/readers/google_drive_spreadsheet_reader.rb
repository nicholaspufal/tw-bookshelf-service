class GoogleDriveSpreadsheetReader
  def initialize(config, google_drive_gem)
    @google_drive_gem = google_drive_gem
    @config = config
  end

  def get_books(tab = "POA")
    spreadsheet = create_session.spreadsheet_by_key(@config.key)
    cells = spreadsheet.workbook_by_title(tab)
  end

  private 

  def create_session
    @google_drive_gem.login(@config.username, @config.password)
  end
end
