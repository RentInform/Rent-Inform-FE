class UserProperty
  attr_reader :street,
               :zip,
               :city,
               :state  

  def initialize(data)
    @street = data[:street]
    @zip = data[:zip]
    @city = data[:city]
    @state = data[:state]
    @id = data[:id]
  end
end