require 'rails_helper'

RSpec.describe Friend do
  describe 'relationhips' do
    it { should have_many(:gifts) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name)  }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:icon) }
  end
  describe 'instance methods' do
    it 'returns an enum value for a friend if a gift has been purchased or pending' do
      friend1 = create :friend, birthday: '1989-09-29'
      gift1 = create :gift, status: 1, updated_at: '2021-10-10'
      friend2 = create :friend, birthday: '1989-09-29'
      gift2 = create :gift, status: 1, updated_at: '2021-05-15'
      friend3 = create :friend, birthday: '1989-09-29'
      gift3 = create :gift, status: 0, updated_at: '2021-05-15'

      create :friend_gift, friend: friend1, gift: gift1
      create :friend_gift, friend: friend2, gift: gift2
      create :friend_gift, friend: friend2, gift: gift2

      expect(friend1.need_gift).to eq(true)
      expect(friend2.need_gift).to eq(false)
      expect(friend3.need_gift).to eq(true)


    end
  end
  # describe 'instance methods' do
  #   it 'returns an enum value for a friend if a gift has been purchased or pending' do
  #     friend1 = create :friend, birthday: '1989-09-29'
  #     gift1 = create :gift, status: 1, updated_at: '2021-10-10'
  #     friend2 = create :friend, birthday: '1989-09-29'
  #     gift2 = create :gift, status: 1, updated_at: '2021-05-15'
  #
  #     create :friend_gift, friend: friend1, gift: gift1
  #     create :friend_gift, friend: friend2, gift: gift2
  #     binding.pry
  #
  #
  #
  #   end
  # end
end
