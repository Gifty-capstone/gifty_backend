require 'rails_helper'

RSpec.describe Friend do
  describe 'relationhips' do
    it { should belong_to(:user) }
    it { should have_many(:friend_gifts) }
    it { should have_many(:gifts).through(:friend_gifts) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name)  }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:icon) }
  end
end
