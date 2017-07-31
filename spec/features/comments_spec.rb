require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  let(:user) { create :user }
  let(:post) { create :post, user_id: user.id }
  let(:comment) { create :comment, user_id: user.id, post_id: post.id }
  context "Registered User" do
    before :each do
      visit new_session_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Submit'
      visit post_path(post)
    end
    scenario 'can view comments of a post' do
      expect(page).to have_content comment.body
    end
    scenario 'can comment on a post'
    scenario 'can delete his/her comment'
    scenario 'can edit his comment'
  end
end
