# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  status     :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :tags
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  validates :title, :body, :status, presence: true
  enum status: [:draft, :secret, :visible]
end
