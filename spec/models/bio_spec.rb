require 'rails_helper'

RSpec.describe Bio, type: :model do
  describe 'association' do
    it {should belong_to(:user) }
  end
end
