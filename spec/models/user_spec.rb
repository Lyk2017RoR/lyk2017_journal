# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string           not null
#  role            :integer          default("0")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should have_secure_password }
  it { should validate_presence_of :role }
  it { should have_many :comments }
  it { should have_many :posts }
  it { should have_many :likes }
  it { should have_many :liked_posts }
  it { should allow_value("utku@omnico.io").for(:email) }
  it { should_not allow_value("aaaomnico.io").for(:email) }
  it { should define_enum_for(:role).with([:regular, :editor, :admin]) }
end
