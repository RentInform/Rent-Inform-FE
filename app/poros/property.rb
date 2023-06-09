class Property
  attr_reader :street,
               :zip,
               :bike_score,
               :walk_score,
               :transit_score,
               :safety_score,
               :city,
               :state,
               :lat,
               :lon,
               :id,
               :parks

  def initialize(data)
    @street = data[:street]
    @zip = data[:zip]
    @bike_score = data[:bike_score]
    @walk_score = data[:walk_score]
    @transit_score = data[:transit_score]
    @safety_score = data[:safety_score]
    @city = data[:city]
    @state = data[:state]
    @lat = data[:lat]
    @lon = data[:lon]
    @id = data[:id]
    @parks = data[:parks]
  end
end
