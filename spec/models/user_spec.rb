require 'rails_helper'

RSpec.describe User do
  describe 'relationhips' do
    it { should have_many(:friends) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name)  }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:icon) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
