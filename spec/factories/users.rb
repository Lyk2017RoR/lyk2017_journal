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

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    # password_digest { BCrypt::Password.create("my password") }
    password "asdqwe12"
    password_confirmation "asdqwe12"
    role 0
  end
end
