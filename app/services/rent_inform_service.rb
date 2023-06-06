class RentInformService

  def get_property(street, zip)
    get_url("/api/v0/search?street=#{street}&zip=#{zip}")
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