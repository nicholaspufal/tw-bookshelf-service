require "sinatra"
require "google_drive"
require "json"
require "yaml"

get '/' do
  config_file = YAML.load_file("config/config.yml")
  session = GoogleDrive.login(config_file["username"], config_file["password"])
  titles = []
  TITLE_COLUMN = 1

  # POA tab
  ws = session.spreadsheet_by_key("0AsVBDHxiMgLbdEtXVG5wNUwyLVVYYTY2NEVxUzRmVlE").worksheets[0]

  ws.num_rows.times do |row_number|
    titles << ws[row_number+2, TITLE_COLUMN]
  end  

  titles.compact.reject!{ |elem| elem == "" }.sort.to_json
end
