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
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  validates :title, :body, :status, presence: true
  enum status: [:draft, :secret, :visible]
  accepts_nested_attributes_for :comments

  validate :check_comment_size, on: :create
  validate :check_time_limit_on_update, on: :update

  def check_comment_size
    comment_size = author.comments.size
    errors[:base] << "Minimum <strong>5</strong> comment
                      required for performing this action.
                      Remaining comment count is #{5-comment_size}" if comment_size < 5
  end

  def check_time_limit_on_update
    errors.add(:created_at, 'You can not update this post in 10 minutes') if created_at > 6.minute.ago
  end
end
