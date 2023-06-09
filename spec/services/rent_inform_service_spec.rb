require 'rails_helper'

RSpec.describe RentInformService do
  before(:each) do
    stub_request(:get, "https://sheltered-harbor-92742.herokuapp.com/api/v0/search?street=123%20Main%20Street&zip=19148")
         .with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.5'
           })
    .to_return(status: 200, body: File.read('./spec/fixtures/property_1.json'))
  end

  describe 'instance methods' do
    it '#get_property' do
      service = RentInformService.new
      property = service.get_property('123 Main Street', '19148')

      expect(property).to be_a(Hash)

      expect(property).to have_key(:data)
      expect(property[:data]).to be_a(Hash)
      expect(property[:data]).to have_key(:id)
      expect(property[:data][:id]).to be_a(String)

      expect(property[:data]).to have_key(:type)
      expect(property[:data][:type]).to be_a(String)

      attributes = property[:data][:attributes]
      expect(attributes[:street]).to eq('123 Main Street')
      expect(attributes[:city]).to eq('Philadelphia')
      expect(attributes[:state]).to eq('PA')
      expect(attributes[:zip]).to eq('19148')
      expect(attributes[:walk_score]).to eq("89")
      expect(attributes[:bike_score]).to eq("26")
      expect(attributes[:transit_score]).to eq("57")
      expect(attributes[:safety_score]).to eq("93")
    end
  end
end