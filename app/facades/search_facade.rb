class SearchFacade

  def initialize(street, zip)
    @street = street
    @zip = zip
  end

  def property
    @_property ||= service.get_property(@street, @zip)
  end
  
  private

    def service
      @_service = RentInformService.new
    end
end