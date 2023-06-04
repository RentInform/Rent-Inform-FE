require 'rails_helper'

RSpec.describe "landing page" do
  before :each do
    visit root_path
  end

  it 'has RentInform on the top of the screen' do
    expect(page).to have_content("RentInform")
  end

  it 'has a link to log in' do
    within "#Login" do
      expect(page).to have_content("Login")
    end
  end

  it 'has a link to sign up for an account' do
    within "#Signup" do
      expect(page).to have_content("Sign Up")
    end
  end

  it 'has a description of the app' do
    within"#Description" do
      expect(page).to have_content("We provide you with code-compliant properties so you can focus on finding the best home for you.")
      expect(page).to have_content("Find a rental that's safe and fit for you")
    end
  end

  it 'has mid page content' do
   within "#mid_page" do
    expect(page).to have_content("Sometimes pictures aren't enough.")
    expect(page).to have_content("Smoke Detectors?")
    expect(page).to have_content("Safe neighborhood?")
    expect(page).to have_content("Lifestyle fit?")
   end
  end

  it 'has bottom page content' do
    within "#bottom_page" do
      expect(page).to have_content("With RentInform")
      expect(page).to have_content("City Code Compliance Check")
      expect(page).to have_content("Walk Score")
      expect(page).to have_content("Bike Score")
      expect(page).to have_content("Transit Score")
      expect(page).to have_content("Safe Place Score")
    end
  end
end