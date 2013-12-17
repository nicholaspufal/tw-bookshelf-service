require "json"

class Book
  attr_accessor :title, :owner, :copies, :location, :comments, :waiting_list, :who_is_reading

  def to_json(*a)
    {
      "title"           => title, 
      "owner"           => owner,
      "copies"          => copies,
      "location"        => location,
      "comments"        => comments,
      "waiting_list"    => waiting_list,
      "who_is_reading"  => who_is_reading 
    }.to_json(*a)
  end
end
