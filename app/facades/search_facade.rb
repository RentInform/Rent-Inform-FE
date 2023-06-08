class SearchFacade

  def initialize(street, zip)
    @street = street
    @zip = zip
  end

  def property
    return SearchError.new if @street.count("a-zA-Z") == 0  
    
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
      bike_score: property[:data][:attributes][:bike_score],
      walk_score: property[:data][:attributes][:walk_score],
      safety_score: property[:data][:attributes][:safety_score],
      transit_score: property[:data][:attributes][:transit_score],
      city: property[:data][:attributes][:city],
      state: property[:data][:attributes][:state],
      id: property[:data][:id]
    }
  end

  def service
    @_service = RentInformService.new
  end
end