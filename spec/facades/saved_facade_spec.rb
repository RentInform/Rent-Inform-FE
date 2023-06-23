require 'rails_helper'

RSpec.describe SavedFacade do
  before :each do
    stub_request(:get, "https://sheltered-harbor-92742.herokuapp.com/api/v0/user_property?user_id=5&property_id=1")
    .with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.5'
      })
    .to_return(status: 200, body: File.read('./spec/fixtures/property_1.json'))
  end
  describe 'instance methods' do
    it '#property' do
      facade = SavedFacade.new('5', '1')
      property = facade.property

      expect(property).to be_a(Property)
      expect(property.street).to eq('123 Main Street')
      expect(property.zip).to eq('19148')
      expect(property.bike_score).to eq('26')
      expect(property.walk_score).to eq('89')
      expect(property.transit_score).to eq('57')
      expect(property.safety_score).to eq('93')
      expect(property.city).to eq('Philadelphia')
      expect(property.state).to eq('PA')
      expect(property.lat).to eq('39.96246')
      expect(property.lon).to eq('-75.13755')
    end
  end
end