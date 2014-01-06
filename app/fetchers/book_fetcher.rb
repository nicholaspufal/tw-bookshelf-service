class BookFetcher
  class << self
    def find_by_office(office_name, model = Book)
      office_name = office_name.downcase
      model.where(office: office_name)
    end
  end
end
