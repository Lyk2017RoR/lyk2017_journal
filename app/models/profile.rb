# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  gravatar   :string
#  first_name :string
#  last_name  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ApplicationRecord
  belongs_to :user
end
