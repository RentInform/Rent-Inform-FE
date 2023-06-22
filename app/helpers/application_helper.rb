module ApplicationHelper
  def prop_ids(user_properties)
    user_properties.map(&:id)
  end

  def map(lat, lon)
    "https://www.mapquestapi.com/staticmap/v5/map?locations=#{lat}, #{lon}&size=400, 400&zoom=12&center=#{lat}, #{lon}&key=#{ENV['MAPQUEST_KEY']}"
  end
end
