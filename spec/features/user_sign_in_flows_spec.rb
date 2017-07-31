require 'rails_helper'

RSpec.feature "User Sign In Flow", type: :feature do
  let(:user) { create :user }
  context 'Guest' do
    scenario 'can register as a new user' do
      user = build :user
      visit new_user_path
      expect{
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password_confirmation
        click_button('Submit')
      }.to change(User, :count).by 1
    end
  end

  context 'Registered User' do
    before :each do
      visit new_session_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button('Submit')
    end
    scenario 'can login as a registered user' do
      expect(page).to have_content user.email
    end
    scenario 'can Sign Out from page' do
      click_link 'Sign Out'
      expect(page).to have_content 'Welcome'
      expect(page).not_to have_content 'Sign Out'
    end
  end
end
