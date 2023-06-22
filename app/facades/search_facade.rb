class SearchFacade

  def initialize(street, zip)
    @street = street
    @zip = zip
  end

  def property
    return SearchError.new if @street.count("a-zA-Z").zero?

    property ||= service.get_property(@street, @zip)
    if property[:data].nil?
      SearchError.new
    else
      Property.new(format_property(property))
    end
  end

  private

  def format_property(property)
    {
      street: property[:data][:attributes][:street],
      zip: property[:data][:attributes][:zip],
      city: property[:data][:attributes][:city],
      state: property[:data][:attributes][:state],
      id: property[:data][:id]
    }
  end

  def service
    @_service = RentInformService.new
  end
end
