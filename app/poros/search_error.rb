class SearchError
  attr_reader :message

  def initialize
    @message = "This Property is not on the Certified Rentals list."
  end
end