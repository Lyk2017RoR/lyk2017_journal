require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  let(:user) { create :user }
  let(:post) { create :post, user_id: user.id }
  context "Registered User" do
    before :each do
      visit new_session_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Submit'
    end
    scenario 'can create post' do
      click_link 'New Post'
      expect(page).to have_content 'New Post'
      fill_in 'post_title', with: 'Something'
      fill_in 'post_body', with: Faker::Lorem.paragraph
      click_button 'Submit'
      expect(page).to have_content 'Something'
    end
    scenario 'can edit his/her posts' do
      visit post_path(post)
      click_link 'Edit'
      expect(page).to have_selector "input[value='#{post.title}']"
    end

    scenario 'can not edit other author\'s posts' do
      user2 = create :user
      post = create :post, user_id: user2.id
      visit post_path(post)
      expect(page).not_to have_content 'Edit'
    end
    scenario 'can delete his posts' do
      visit post_path(post)
      expect(page).to have_link 'Delete'
      click_link 'Delete'
      expect(page).not_to have_content post.title
    end
    scenario 'can update a single post' do
      visit edit_post_path(post)
      expect(page).to have_selector "input[value='#{post.title}']"
      fill_in 'post_title', with: 'sdasdasdasdadsa'
      click_button 'Submit'
      expect(page).not_to have_selector "input[value='#{post.title}']"
    end
  end
end
