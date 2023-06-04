require 'rails_helper'

RSpec.describe "user registration" do
  before :each do
    visit sign_up_path
  end

  it 'as a user, I see a disclaimer about google' do
    within '#disclaimer' do
      expect(page).to have_content('RentInfrom uses Google for new user creation')
    end
  end

  it 'as a user I see decorative text' do
    within '#decorative' do
      expect(page).to have_content('Find your home')
    end
  end

  it 'as a user I see a button to sign up with google' do
    within '#google' do
      expect(page).to have_link('Sign Up with Google')
    end
  end

  it 'as a user I see a button to log in' do
    within '#login' do
      expect(page).to have_content('Already have an account?')
      expect(page).to have_link('Log In')
    end
    save_and_open_page
  end

  it 'as a user when I click the login button, I am take to the log in page' do
    within '#login' do
      click_link 'Log In'
      expect(current_path).to eq(login_path)
    end
    
    visit login_path
    expect(page).to have_content('RentInform#Log In')
  end
end