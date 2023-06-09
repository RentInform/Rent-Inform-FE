require 'rails_helper'

RSpec.describe 'dashboard show page' do
  describe 'happy path' do
    before :each do
      @user = create(:user, id: 420)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_property?property_id=2&user_id=420')
      .with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/property_2.json'))

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_property?property_id=1&user_id=420')
      .with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/property_1.json'))

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/search?street=123%20Main%20Street&zip=19148')
      .with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/search_property_1.json'))

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
      visit dashboard_path
      expect(page).to have_button('Log out')
    end

    it 'logs out the user' do
      visit dashboard_path

      click_button 'Log out'

      expect(current_path).to eq(root_path)
    end

    it 'has a find property subheader' do
      visit dashboard_path
      within'#find-property' do
        expect(page).to have_content('Find a Compliant Property')
      end
    end

    it 'has a search bar' do
      visit dashboard_path

      expect(page).to have_field(:search_street)
      expect(page).to have_field(:search_zip)
    end

    it 'searches and provides a link for more details' do
      visit dashboard_path

      fill_in :search_street, with: '123 Main Street'
      fill_in :search_zip, with: '19148'
      click_button 'Search'
      expect(current_path).to eq(dashboard_path)

      within '#Result' do
        expect(page).to have_content('certified to rent')
        expect(page).to have_content('123 Main Street')
        expect(page).to have_content('Philadelphia')
        expect(page).to have_content('PA')
        expect(page).to have_content('19148')


        expect(page).to_not have_content('89')
        expect(page).to_not have_content('Walk Score')
        expect(page).to_not have_content('26')
        expect(page).to_not have_content('Bike Score')
        expect(page).to_not have_content('57')
        expect(page).to_not have_content('Transit Score')
        expect(page).to_not have_content('7')
        expect(page).to_not have_content('Safety Score')

        expect(page).to have_button('More Details')
        click_button('More Details')
        expect(current_path).to eq(property_path(420, 1))
      end
    end

    it 'gets a list of user_properties' do
      visit dashboard_path

      within '#Saved' do
        expect(page).to have_content('100 Nowhere Street')
        expect(page).to have_content('456 Center Street')
        expect(page).to have_content('789 Memory Lane')
      end
    end

    it 'takes user to show page and displays details when user clicks more details' do
      visit dashboard_path

      within '#property-2' do
        click_button 'More Details'
        expect(current_path).to eq(property_path(420, 2))
      end

      within '#Result' do
        expect(page).to have_content('Certified to Rent')
        expect(page).to have_content('456 Center Street')
        expect(page).to have_content('19148')
        expect(page).to have_content('55')
        expect(page).to have_content('Walk Score')
        expect(page).to have_content('73')
        expect(page).to have_content('Bike Score')
        expect(page).to have_content('97')
        expect(page).to have_content('Transit Score')
        expect(page).to have_content('35')
        expect(page).to have_content('Safety Score')
      end
    end

    it 'can show a searched property, then show more details on a show page' do
      visit dashboard_path

      fill_in :search_street, with: '123 Main Street'
      fill_in :search_zip, with: '19148'
      click_button 'Search'
      expect(current_path).to eq(dashboard_path)

      within '#Result' do
        expect(page).to have_content('certified to rent')
        expect(page).to have_content('123 Main Street')
        expect(page).to have_content('19148')
        expect(page).to_not have_content('89')
        expect(page).to_not have_content('Walk Score')
        expect(page).to_not have_content('26')
        expect(page).to_not have_content('Bike Score')
        expect(page).to_not have_content('57')
        expect(page).to_not have_content('Transit Score')
        expect(page).to_not have_content('7')
        expect(page).to_not have_content('Safety Score')
      end

      within '#property-2' do
        click_button 'More Details'
        expect(current_path).to eq(property_path(420, 2))
      end

      within '#Result' do
        expect(page).to have_content('Certified to Rent')
        expect(page).to have_content('456 Center Street')
        expect(page).to have_content('19148')
        expect(page).to have_content('55')
        expect(page).to have_content('Walk Score')
        expect(page).to have_content('73')
        expect(page).to have_content('Bike Score')
        expect(page).to have_content('97')
        expect(page).to have_content('Transit Score')
        expect(page).to have_content('35')
        expect(page).to have_content('Safety Score')
      end
    end

    it 'a user can save a property' do
      stub_request(:post, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_property?property_id=1&user_id=420').
      to_return(status: 200, body: File.read('./spec/fixtures/save_property.json'))

      visit dashboard_path

      fill_in :search_street, with: '123 Main Street'
      fill_in :search_zip, with: '19148'
      click_button 'Search'

      within '#Result' do
        click_button 'Save'
      end

      expect(current_path).to eq(dashboard_path)

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_properties?user_id=420')
      .with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/user_properties_2.json'))

      visit dashboard_path

      within '#Saved' do
        expect(page).to have_content('123 Main Street')

        within '#property-1' do
          expect(page).to_not have_css 'svg.save'
          expect(page).to have_css 'svg.unsave'
        end
      end
    end

    it 'a user can delete a property' do
      stub_request(:delete, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_property?property_id=1&user_id=420').
      to_return(status: 200, body: File.read('./spec/fixtures/unsave_property.json'))

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_properties?user_id=420')
      .with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/user_properties_2.json'))

      visit dashboard_path

      within '#property-1' do
        page.find('svg.unsave').click
      end

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_properties?user_id=420')
      .with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/user_properties_1.json'))

      visit dashboard_path

      within '#Saved' do
        expect(page).to_not have_content('123 Main Street')
      end
    end
  end

  describe 'sad path' do
    before :each do
      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/search?street=123%20Main%20Street&zip=19148')
      .with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/search_property_1.json'))
    end

    it 'redirects to home page if not logged in' do
      visit dashboard_path

      expect(page).to have_content('You must be logged in to view this page')
      expect(current_path).to eq(root_path)
    end

    it 'does not render user_properties if none are found' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://sheltered-harbor-92742.herokuapp.com/api/v0/user_properties?user_id=#{user.id}")
      .with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/no_user_properties.json'))


      visit dashboard_path

      expect(page).to have_content("No properties saved... yet!\nSearch and save a property to view it here")
    end

    it 'does not render property if no result is found' do
      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/search?street=65891%20Not%20a%20real%20street&zip=84606')
      .with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.5'
        })
      .to_return(status: 200, body: File.read('./spec/fixtures/no_property.json'))

      stub_request(:get, 'https://sheltered-harbor-92742.herokuapp.com/api/v0/user_properties?user_id=338')
        .with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.5'
           })
        .to_return(status: 200, body: File.read('./spec/fixtures/no_user_properties.json'))

      user = create(:user, id: 338)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      fill_in :search_street, with: '65891 Not a real street'
      fill_in :search_zip, with: '84606'
      click_button 'Search'
      expect(current_path).to eq(dashboard_path)

      within '#Result' do
        expect(page).to_not have_content('Certified to Rent')
        expect(page).to have_content("Sorry, we can't find this address in Philadelphia's Certificate of Rental Suitability database")
        expect(page).to have_content("Sorry, we can't find this address in Philadelphia's Certificate of Rental Suitability database")
        expect(page).to have_link('here', href: 'https://www.phila.gov/documents/partners-in-good-housing-brochures/')
      end
    end
  end
end
