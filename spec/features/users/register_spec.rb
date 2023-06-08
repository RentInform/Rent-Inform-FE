require 'rails_helper'

RSpec.describe "user registration" do
  before :each do
    visit sign_up_path
  end

  it 'as a user I see the title text' do
    within '#title' do
      expect(page).to have_content('Find your home')
    end
  end

  it 'as a user I see a button to sign up with google' do
    within '#google-link' do
      expect(page).to have_css('a[href="https://accounts.google.com/signup/v2/createaccount?biz=false"]')
    end
  end

  it 'as a user I see a button to log in' do
    within '#login' do
      expect(page).to have_content('Already have an account?')
      expect(page).to have_link('Log in')
    end
  end

  it 'as a user when I click the login button, I am take to the log in page' do
    within '#login' do
      click_link 'Log in'
      expect(current_path).to eq(login_path)
    end

    visit login_path
    expect(page).to have_content('RentInform')
  end
end
