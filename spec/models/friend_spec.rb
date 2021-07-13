require 'rails_helper'

RSpec.describe Friend do
  describe 'relationhips' do
    it { should belong_to(:friend) }
    it { should have_many(:friend_gifts) }
    it { should have_many(:gifts).through(:friend_gifts) }
  end
end
