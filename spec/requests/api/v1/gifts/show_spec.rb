require 'rails_helper'

describe 'Friend Gifts show - GET api/v1/gifts' do
  describe  'Happy path' do
    it 'Shows a specific gift of the friend', :vcr do
      user = create :user
      friend = create :friend, birthday: '1989-09-29', user: user
      gift1 = create :gift, status: 0, friend: friend, name: "nintendo"

      get "/api/v1/users/#{user.id}/friends/#{friend.id}/gifts/#{gift1.id}"

      friend = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(friend).to be_a Hash

      gifts = friend[:data][:attributes]
      expect(friend[:data]).to have_key(:attributes)
      expect(gifts).to have_key(:name)
      expect(gifts).to have_key(:description)
      expect(gifts).to have_key(:status)
      expect(gifts).to have_key(:products)
      expect(gifts[:products].count).to eq(3)
    end
  end

  describe  'Sad path' do
    it 'Specific gift of the friend does not exist' do
      user = create :user
      friend = create :friend, birthday: '1989-09-29', user: user
      gift1 = create :gift, status: 0, friend: friend
      gift3 = create :gift, status: 0, friend: friend

      get "/api/v1/users/#{user.id}/friends/#{friend.id}/gifts/10"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
