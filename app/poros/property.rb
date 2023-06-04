class Property
  attr_reader :street,
               :zip,
               :bike_score,
               :walk_score,
               :transit_score,
               :safety_score  

  def initialize(data)
    @street = data[:street]
    @zip = data[:zip]
    @bike_score = data[:bike_score]
    @walk_score = data[:walk_score]
    @transit_score = data[:transit_score]
    @safety_score = data[:safety_score]
  end
              
end