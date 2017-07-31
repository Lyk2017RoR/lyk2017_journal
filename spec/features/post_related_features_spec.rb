require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  let(:user) { create :user }
  context "Registered User" do
    scenario 'can create post' do
      visit new_session_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Submit'
      expect(page).to have_content user.email
      click_link 'New Post'
      expect(page).to have_content 'New Post'
      fill_in 'title', with: 'Something'
      fill_in 'body', with: Faker::Lorem.paragraph
      click_button 'Submit'
      expect(page).to have_content 'Something'
    end
    scenario 'can edit his/her posts'
    scenario 'can delete his posts'
    scenario 'can update a single post'
  end
end
