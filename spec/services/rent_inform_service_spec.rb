require 'rails_helper'

RSpec.describe RentInformService do
  before(:each) do
    WebMock.stub_request(:get, "https://test.com/return_json/properties.json/api/v0/search?street=123+Main+Street&zip=19148")
     .to_return(status: 200, body: File.read('./spec/fixtures/property_1.json'))
  end

  describe 'instance methods' do
    it '#get_property' do
      service = RentInformService.new
      property = service.get_property('https://test.com/return_json/properties.json', '123 Main Street', '19148')

      expect(property).to be_a(Hash)

      expect(property).to have_key(:data)
      expect(property[:data]).to be_a(Hash)
      expect(property[:data]).to have_key(:id)
      expect(property[:data][:id]).to be_a(String)

      expect(property[:data]).to have_key(:type)
      expect(property[:data][:type]).to be_a(String)

      attributes = property[:data][:attributes]
      expect(attributes[:address]).to eq('123 Main Street')
      expect(attributes[:city]).to eq('Philadelphia')
      expect(attributes[:state]).to eq('PA')
      expect(attributes[:zip]).to eq('19148')
      expect(attributes[:walk_score]).to eq("89")
      expect(attributes[:bike_score]).to eq("23")
      expect(attributes[:transit_score]).to eq("57")
      expect(attributes[:safety_score]).to eq("99")
    end
  end
end