require 'rails_helper'

RSpec.describe Gift, type: :model do
  describe 'relationhips' do
    it { should have_many(:friend_gifts) }
    it { should have_many(:friends).through(:friend_gifts) }
  end
end
