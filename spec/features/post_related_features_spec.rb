require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  context "Registered User" do
    scenario 'can create post'
    scenario 'can edit his/her posts'
    scenario 'can delete his posts'
    scenario 'can update a single post'
  end
end
