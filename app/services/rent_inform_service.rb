class RentInformService

  def get_property(street, zip)
    get_url("/api/v0/search?street=#{street}&zip=#{zip}")
  end

  def get_user_properties(user_id)
    get_url("/api/v0/user_properties?user_id=#{user_id}")
  end
  
  def get_property_by_id(user_id, property_id)
    get_url("/api/v0/user_properties?user_id=#{user_id}&property_id=#{property_id}")
  end

  private

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://sheltered-harbor-92742.herokuapp.com') do |faraday|
      end
    end
end