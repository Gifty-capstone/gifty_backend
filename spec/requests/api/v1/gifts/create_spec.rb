require 'rails_helper'

RSpec.describe 'Create Gift - POST api/v1/gifts' do
  describe 'happy path' do
    it 'creates a gift with correct params' do
      user = create :user
      friend1 = create :friend, birthday: '1989-09-29', user: user
      gift1 = create :gift, status: 0, friend: friend1

      post "/api/v1/users/#{user.id}/friends/#{friend1.id}/gifts",

      params: { name: "Guitar",
                description: "music lover",
                status: 'pending' }

      gift = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(gift[:data][:attributes]).to have_key(:name)
      expect(gift[:data][:attributes]).to have_key(:description)
      expect(gift[:data][:attributes]).to have_key(:status)
    end
  end
end
