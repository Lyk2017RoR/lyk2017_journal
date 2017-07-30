# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }
  it { should have_and_belong_to_many :posts }
end
