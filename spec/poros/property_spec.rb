require 'rails_helper'

RSpec.describe Property do
  it 'exists' do
    data = {
      street: "123 Main Street",
      city: "Philadelphia",
      state: "PA",
      zip: "19148",
      walk_score: "89",
      bike_score: "23",
      transit_score: "57",
      safety_score: "99",
      city: "Philadelphia",
      state: "PA"
    }
    property = Property.new(data)

    expect(property).to be_a(Property)
    expect(property.street).to eq("123 Main Street")
    expect(property.zip).to eq("19148")
    expect(property.walk_score).to eq("89")
    expect(property.bike_score).to eq("23")
    expect(property.transit_score).to eq("57")
    expect(property.safety_score).to eq("99")
  end
end