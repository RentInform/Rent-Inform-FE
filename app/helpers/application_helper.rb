module ApplicationHelper
  def prop_ids(user_properties)
    user_properties.map(&:id)
  end

  def map(lat, lon)
    "https://www.mapquestapi.com/staticmap/v5/map?locations=#{lat}, #{lon}&size=400, 400&zoom=12&center=#{lat}, #{lon}&defaultMarker=marker-lg-1D4ED8&key=#{ENV['MAPQUEST_KEY']}"
  end

  def format_parks(parks)
    return [{ name: 'No parks found.', street: '' }] if parks.empty?

    [{ name: parks[:park_1_name], street: parks[:park_1_street] },
     { name: parks[:park_2_name], street: parks[:park_2_street] },
     { name: parks[:park_3_name], street: parks[:park_3_street] }]
  end
end
