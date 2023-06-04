class RentInformService

  def get_property(url, street, zip)
    get_url("/api/v0/search?street=#{street}&zip=#{zip}")
  end

  private

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://test.com/return_json/properties.json') do |faraday|
      end
    end
end