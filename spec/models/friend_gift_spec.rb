require 'rails_helper'

RSpec.describe FriendGift do
  describe 'relationships' do
    it { should belong_to(:friend) }
    it { should belong_to(:gift) }
  end
end
