require 'rails_helper'

RSpec.describe "dashboard show page" do
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
  it 'has a button to log out' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_button("Log Out")
  end

  it 'logs out the user' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_button "Log Out"

    expect(current_path).to eq(root_path)
  end


  it 'has a button to the home page'do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_button("Home")

    click_button "Home"

    expect(current_path).to eq(root_path)
  end

  it 'has a find property subheader' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    within"#find-property" do
      expect(page).to have_content("Find a Property")
    end
  end

  it 'has a search bar' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_field(:search_street)
    expect(page).to have_field(:search_zip)
  end
  
  it 'searches' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    fill_in :search_street, with: "123 Main Street"
    fill_in :search_zip, with: "19148"
    click_button "Search"
    expect(current_path).to eq(dashboard_path)
    
    within "#Result" do
      expect(page).to have_content("This Property is on the Certified Rentals list!")
      expect(page).to have_content("123 Main Street")
      expect(page).to have_content("19148")
      expect(page).to have_content("Walk Score: 89")
      expect(page).to have_content("Bike Score: 23")
      expect(page).to have_content("Transit Score: 57")
      expect(page).to have_content("Safety Score: 99")
    end
  end

  describe 'sad path' do
    it 'redirects to home page if not logged in' do
      visit dashboard_path

      expect(page).to have_content("You must be logged in to view this page")
      expect(current_path).to eq(root_path)
    end
  end
end