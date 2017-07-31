require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  context "Registered User" do
    scenario 'can view comments of a post'
    scenario 'can comment on a post'
    scenario 'can delete his/her comment'
    scenario 'can edit his comment'
  end
end
