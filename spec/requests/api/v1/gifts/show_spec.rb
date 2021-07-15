require 'rails_helper'

describe 'Friend Gifts show - GET api/v1/gifts' do
  describe  'Happy path' do
    it 'Shows a specific gift of the friend' do
      user = create :user
      friend = create :friend, birthday: '1989-09-29', user: user
      gift1 = create :gift, status: 0, friend: friend

      get "/api/v1/users/#{user.id}/friends/#{friend.id}/gifts/#{gift1.id}"

      friend = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(friend).to be_a Hash

      gifts = friend[:data][:attributes]
      expect(friend[:data]).to have_key(:attributes)
      expect(gifts).to have_key(:name)
      expect(gifts).to have_key(:description)
      expect(gifts).to have_key(:status)
    end
  end

  # describe  'Sad path' do
  #   it 'Specific gift of the friend does not exist' do
  #     user = create :user
  #     friend = create :friend, birthday: '1989-09-29', user: user
  #     gift1 = create :gift, status: 0, friend: friend
  #     gift3 = create :gift, status: 0, friend: friend
  #
  #
  #     get "/api/v1/users/#{user.id}/friends/#{friend.id}/gifts/#{gift2.id}"
  #
  #     params: { name: "Guitar",
  #               description: "music lover",
  #               status: 'pending' }
  #
  #
  #     expect(response).to have_http_status(:bad_request)
  #     expect(error).to have_key(:error)
  #     expect(error[:error]).to eq("#{error_message}")
      #
      # gifts = friend[:data][:attributes]
      # expect(friend[:data]).to have_key(:attributes)
      # expect(gifts).to have_key(:name)
      # expect(gifts).to have_key(:description)
      # expect(gifts).to have_key(:status)
    # end
  # end
end
