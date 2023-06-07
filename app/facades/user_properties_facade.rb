class UserPropertiesFacade
  def initialize(user_id)
    @user_id = user_id
  end

  def user_properties
    user_properties_data ||= service.get_user_properties(@user_id)

    user_properties = user_properties_data[:data]
    
    user_properties.map do |property|
      UserProperty.new(format_property(property))
    end
  end

  private

  def format_property(property)
    {
      street: property[:attributes][:street],
      zip: property[:attributes][:zip],
      city: property[:attributes][:city],
      state: property[:attributes][:state],
      id: property[:id]
    }
  end

  def service
    @_service = RentInformService.new
  end
end