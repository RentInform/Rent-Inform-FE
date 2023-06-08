require 'rails_helper'

RSpec.describe 'user login' do
  before :each do
    visit login_path
  end

  it 'as a user I see a welcome message' do
    within '#welcome' do
      expect(page).to have_content('Welcome back')
    end
  end

  xit 'as a user I see a link to log in with google' do
    within 'img' do
      expect(page).to have_link('https://mysterious-escarpment-07313.heroku.com/auth/google_oauth2')
    end
  end

  it 'as a user I see a link to sign up' do
    within '#sign-up' do
      expect(page).to have_content("Don't have an account?")
      expect(page).to have_link('Sign up')
    end
  end

  it 'as a user when I click the sign up button, I am take to the sign up page' do
    within '#sign-up' do
      click_link 'Sign up'
      expect(current_path).to eq(sign_up_path)
    end
  end
end