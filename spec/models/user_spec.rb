require 'rails_helper'

RSpec.describe User do
  describe 'relationhips' do
    it { should have_many(:friends) }
  end
end
