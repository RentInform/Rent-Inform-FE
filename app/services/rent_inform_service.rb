class RentInformService
  def get_property(street, zip)
    Rails.cache.fetch([street], expires: 1.week) do
      get_url("/api/v0/search?street=#{street}&zip=#{zip}")
    end
  end

  def get_user_properties(user_id)
    get_url("/api/v0/user_properties?user_id=#{user_id}")
  end

  def get_property_by_id(user_id, property_id)
    Rails.cache.fetch([property_id], expires: 1.week) do
      get_url("/api/v0/user_property?user_id=#{user_id}&property_id=#{property_id}")
    end
  end

  def save_property(user_id, property_id)
    post_url("/api/v0/user_property?user_id=#{user_id}&property_id=#{property_id}")
  end

  def unsave_property(user_id, property_id)
    delete_url("/api/v0/user_property?user_id=#{user_id}&property_id=#{property_id}")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_url(url)
    response = conn.post(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_url(url)
    conn.delete(url)
  end

  def conn
    Faraday.new(url: 'https://sheltered-harbor-92742.herokuapp.com') do |faraday|
    end
  end
end
