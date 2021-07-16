require 'rails_helper'

describe 'Friend Gifts - GET api/v1/gifts' do
  describe  'Happy path' do
    it 'list all  of friend gifts' do
      user = create :user
      friend1 = create :friend, birthday: '1989-09-29', user: user
      gift1 = create :gift, status: 0, friend: friend1
      friend2 = create :friend, birthday: '1989-09-29', user: user
      gift2 = create :gift, status: 0, friend: friend2
      gift3 = create :gift, status: 0, friend: friend2

      get "/api/v1/users/#{user.id}/friends/#{friend1.id}/gifts"

      friends = JSON.parse(response.body, symbolize_names: true)
      expect(friends[:included].count).to eq(1)

      expect(response).to be_successful
      expect(friends).to be_a Hash

      attributes = friends[:data][:attributes]
      expect(friends[:data]).to have_key(:attributes)
      expect(attributes).to have_key(:name)
      expect(attributes).to have_key(:birthday)
      expect(attributes).to have_key(:memo)

      gifts = friends[:included].first[:attributes]
      expect(gifts).to have_key(:description)
      expect(gifts).to have_key(:name)
      expect(gifts).to have_key(:status)
    end

    it 'gives zero 0 if friend has no gift' do
      user = create :user
      friend1 = create :friend, birthday: '1989-09-29', user: user
      friend2 = create :friend, birthday: '1989-09-29', user: user

      get "/api/v1/users/#{user.id}/friends/#{friend2.id}/gifts"

      friends = JSON.parse(response.body, symbolize_names: true)
      expect(friends[:included].count).to eq(0)

      expect(response).to be_successful
      expect(friends).to be_a Hash
    end

    describe  'Sad path' do
      it 'friend does not exist, cannot list gift' do
        user = create :user
        friend1 = create :friend, birthday: '1989-09-29', user: user
        gift1 = create :gift, status: 0, friend: friend1
        gift2 = create :gift, status: 0, friend: friend1
        gift3 = create :gift, status: 0, friend: friend1

        get "/api/v1/users/#{user.id}/friends/4/gifts"

        friends = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(friends).to be_a Hash
      end
    end
  end
end
