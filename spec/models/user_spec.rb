require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it {should have_many(:posts) }
    it {should have_many(:comments) }
    it {should have_one(:bio) }
  end
end
