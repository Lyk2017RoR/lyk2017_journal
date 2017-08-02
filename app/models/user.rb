# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string           not null
#  role            :integer          default("regular")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  has_one :profile, inverse_of: :user, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum role: %i[regular editor admin]

  validates :email,         presence: true,
                            format: {
                              with: /([\w\.\-]+@\w+\.\w{2,3}(?:\.?\.?\w{2,3})?)/
                            },
                            uniqueness: true

  validates :password,      presence: true,
                            length: { minimum: 8, maximum: 32 }

  validates :terms_of_use,  acceptance: true

  accepts_nested_attributes_for :profile

  def full_name
    [profile.first_name, profile.last_name].join(' ') if profile.present?
  end
end
