require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'belongs_to' do
    it {should belong_to(:user) }
  end
  describe 'association and dependency' do
    it {should have_many(:comments).dependent(:destroy) }
  end
end
