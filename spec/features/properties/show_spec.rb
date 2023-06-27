require 'rails_helper'

RSpec.describe 'property show page' do
  describe 'happy path' do
    before :each do
      @user = create(:user, id: 420)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_property?property_id=1&user_id=420')
      .with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/property_1.json'))

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_properties?user_id=420')
      .with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/user_properties_1.json'))
    end

    it 'has a button to log out' do
      visit property_path(@user.id, 1)
      expect(page).to have_button('Log out')
    end

    it 'logs out the user' do
      visit property_path(@user.id, 1)

      click_button 'Log out'

      expect(current_path).to eq(root_path)
    end

    it 'has a button to go back to the dashboard' do
      visit property_path(@user.id, 1)
      expect(page).to have_link('My Dashboard')
    end

    it 'returns user to their dashboard' do
      visit property_path(@user.id, 1)

      click_link 'My Dashboard'

      expect(current_path).to eq(dashboard_path)
    end

    it 'displays property details' do
      visit property_path(@user.id, 1)

      within '#Result' do
        expect(page).to have_content('Certified to Rent')
        expect(page).to have_content('123 Main Street')
        expect(page).to have_content('Philadelphia')
        expect(page).to have_content('PA')
        expect(page).to have_content('19148')
        expect(page).to have_content('89')
        expect(page).to have_content('Walk Score')
        expect(page).to have_content('23')
        expect(page).to have_content('Bike Score')
        expect(page).to have_content('57')
        expect(page).to have_content('Transit Score')
        expect(page).to have_content('1')
        expect(page).to have_content('Safety Score')
      end
    end

    # it 'displays a map' do  #this is a placeholder test
    #   visit property_path(@user.id, 1)

    #   within '#Map' do
    #     expect(page).to have_css(".img")
    #   end
    # end
  end
end
