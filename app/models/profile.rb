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
  before_create :set_gravatar
  before_create :titleize_attributes

  belongs_to :user

  validates :first_name,  presence: true
  validates :last_name,   presence: true

  def small_photo
    get_gravatar 160
  end

  def medium_photo
    get_gravatar 320
  end

  def big_photo
    get_gravatar 640
  end

  private

  def get_gravatar(size)
    [gravatar, '.png?s=', size].join('')
  end

  def set_gravatar
    self.gravatar = [
      'https://www.gravatar.com/avatar/',
      Digest::MD5.hexdigest(user.email)
    ].join('')
  end

  def titleize_attributes
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end
end
