require 'rails_helper'

RSpec.describe Gift, type: :model do
  describe 'relationships' do
    it { should have_many(:friend_gifts) }
    it { should have_many(:friends).through(:friend_gifts) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name)  }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
