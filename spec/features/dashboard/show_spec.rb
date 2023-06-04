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
end