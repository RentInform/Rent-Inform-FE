require 'rails_helper'

RSpec.describe SearchFacade do
  before :each do
    stub_request(:get, "https://test.com/api/v0/search?street=123%20Main%20Street&zip=19148").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.5'
           })
    .to_return(status: 200, body: File.read('./spec/fixtures/property_1.json'))
  end
  describe 'instance methods' do
    it '#property' do
      facade = SearchFacade.new('123 Main Street', '19148')
      property = facade.property
      

      expect(property).to be_a(Property)
      expect(property.street).to eq('123 Main Street')
      expect(property.zip).to eq('19148')
      expect(property.bike_score).to eq('23')
      expect(property.walk_score).to eq('89')
      expect(property.transit_score).to eq('57')
      expect(property.safety_score).to eq('99')
    end
  end
end