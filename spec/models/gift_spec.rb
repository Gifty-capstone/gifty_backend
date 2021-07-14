require 'rails_helper'

RSpec.describe Gift, type: :model do
  describe 'relationships' do
    it { should belong_to(:friend) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name)  }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
