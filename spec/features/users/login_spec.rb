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

  it 'as a user I see a link to log in with google' do
    within '#google' do
      expect(page).to have_link('Log In with Google')
    end
  end

  it 'as a user I see a link to sign up' do
    within '#signup' do
      expect(page).to have_content("Don't have an account?")
      expect(page).to have_link('Sign Up')
    end
  end

  it 'as a user when I click the sign up button, I am take to the sign up page' do
    within '#signup' do
      click_link 'Sign Up'
      expect(current_path).to eq(sign_up_path)
    end
  end
end