class ConfigLoader
  def initialize(path)
    @config = load_yaml(path)
  end

  def username
    @config.fetch("username")
  end

  def password
    @config.fetch("password")
  end

  def spreadsheet_key
    @config.fetch("spreadsheet_key")
  end

  def google_books_api_key
    @config.fetch("google_books_api_key")
  end

  private

  def load_yaml(path)
    YAML.load_file(path)
  end
end
