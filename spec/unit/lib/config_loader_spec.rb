require "spec_helper"

describe ConfigLoader do
  it "loads from an YAML file" do
    parsed_yaml = double("a parsed YAML file")
    path = "path/to/the/yaml/config/file"
    yaml_loader = double("anything that is able to load an YAML file")

    YAML.should_receive(:load_file).with(path).and_return(parsed_yaml)
    parsed_yaml.should_receive(:fetch).with("username").and_return("returned username")
    parsed_yaml.should_receive(:fetch).with("password").and_return("returned password")
    parsed_yaml.should_receive(:fetch).with("spreadsheet_key").and_return("returned key")
    parsed_yaml.should_receive(:fetch).with("google_books_api_key").and_return("returned google books api key")

    config_loader = ConfigLoader.new(path)

    config_loader.username.should == "returned username"
    config_loader.password.should == "returned password"
    config_loader.spreadsheet_key.should == "returned key"
    config_loader.google_books_api_key.should == "returned google books api key"
  end
end
