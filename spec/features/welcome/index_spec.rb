require 'rails_helper'

RSpec.describe "landing page" do
  before :each do
    visit root_path
  end

  it 'has RentInform on the top of the screen' do
    expect(page).to have_css("img.logo")
  end

  it 'has a link to log in' do
    within "#header-buttons" do
      expect(page).to have_content("Log in")
    end
  end

  it 'has a link to sign up for an account' do
    within "#header-buttons" do
      expect(page).to have_content("Sign up")
    end
  end

  it 'has a description of the app' do
    within"#Description" do
      expect(page).to have_content("We provide you with code-compliant properties so you can focus on finding the best home for you.")
      expect(page).to have_content("Find a rental that's safe and fit for you")

      expect(page).to have_content("Sign up")
    end
    within "#Signup1" do
      click_link "Sign up"
    end

    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content('Find your home')
  end

  it 'has mid page content' do
   within "#mid_page" do
    expect(page).to have_content("Sometimes pictures aren't enough")
    expect(page).to have_content("Up to building code?")
    expect(page).to have_content("Safe neighborhood?")
    expect(page).to have_content("Lifestyle fit?")
   end
  end

  it 'has bottom page content' do
    within "#bottom_page" do
      expect(page).to have_content("With")
      expect(page).to have_css("img.logo")
      expect(page).to have_content("City Code Compliance Check")
      expect(page).to have_content("Walk Score")
      expect(page).to have_content("Bike Score")
      expect(page).to have_content("Transit Score")
      expect(page).to have_content("Safe Place Score")

      expect(page).to have_content("Sign up")
    end
    within "#Signup2" do
      click_link "Sign up"
    end

    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content('Find your home')
  end

  it 'sign up link takes you to sign up page' do
    within "#header-buttons" do
      click_link "Sign up"
    end

    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content('Find your home')
  end

  it 'login link takes you to login page' do
    within "#header-buttons" do
      click_link "Log in"
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Welcome back')
  end
end
