require 'rails_helper'

RSpec.describe "landing page" do
  before :each do
    visit root_path
  end

  it 'has a link to log in' do
    expect(page).to have_content("Login")
  end

  it 'has a link to sign up for an account' do
    expect(page).to have_content("Sign Up")
  end

  it 'has a description of the app' do
    expect(page).to have_content("We provide you with code-compliant properties so you can focus on finding the best home for you.")
  end

  it 'sign up link takes you to sign up page' do
    click_link "Sign Up"

    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content('RentInform#Sign Up')
  end
end