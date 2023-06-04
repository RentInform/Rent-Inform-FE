require 'rails_helper'

RSpec.describe "dashboard show page" do
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

  xit 'has a search bar' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_field(:search_street)
    expect(page).to have_field(:search_zip)
  end
end