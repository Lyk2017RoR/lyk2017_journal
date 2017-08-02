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
  has_one :profile, inverse_of: :user
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments
  accepts_nested_attributes_for :profile
  validates :email, :password, :role, presence: true
  validates :email, format: { with: /([\.\w\-]+@\w+\.\w{2,3}(?:\.?\.?\w{2,3})?)/ }
  validates :terms_of_service, acceptance: true, presence: true, on: :create
  validates :password, length: { minimum: 8, maximum: 30 }
  enum role: [:regular, :editor, :admin]
  validates :terms_of_use, acceptance: true
end
