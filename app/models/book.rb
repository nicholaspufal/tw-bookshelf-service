class Book
  include Mongoid::Document

  field :title, type: String
  field :owner, type: String
  field :copies, type: Integer
  field :location, type: String
  field :comments, type: String
  field :waiting_list, type: String
  field :who_is_reading, type: String
  field :cover, type: String
  field :office, type: String

  def serializable_hash(options={})
    {
      title:          title,
      owner:          owner,
      copies:         copies,
      location:       location,
      comments:       comments,
      waiting_list:   waiting_list,
      who_is_reading: who_is_reading,
      cover:          cover,
      office:         office
    }
  end
end
