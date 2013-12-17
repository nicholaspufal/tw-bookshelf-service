require "YAML"

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

  def key
    @config.fetch("key")
  end

  private

  def load_yaml(path)
    YAML.load_file(path)
  end
end
