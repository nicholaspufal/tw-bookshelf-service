class Book
  attr_reader :title, :original_owner

  def initialize(title, original_owner)
    @title, @original_owner = title, original_owner
  end
end
