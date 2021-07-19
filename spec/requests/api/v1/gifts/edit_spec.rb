require 'rails_helper'

RSpec.describe 'edit Gift - POST api/v1/gifts' do
  before do
    @user = create :user
    @friend1 = create :friend, birthday: '1989-09-29', user: @user
    @gift = create :gift, status: 0, friend: @friend1, name: "nintendo"
  end

  describe 'happy path' do
    it 'edits a gift with correct params', :vcr do
      patch "/api/v1/users/#{@user.id}/friends/#{@friend1.id}/gifts/#{@gift.id}",
            params: {
              status: 'purchased'
            }

      gift = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(gift[:data][:attributes]).to have_key(:name)
      expect(gift[:data][:attributes]).to have_key(:description)
      expect(gift[:data][:attributes]).to have_key(:status)
      expect(gift[:data][:attributes][:status]).to eq('purchased')
    end

    describe 'sad path' do
      it 'return an error if any attribute is missing', :vcr do
        patch "/api/v1/users/#{@user.id}/friends/#{@friend1.id}/gifts/#{@gift.id}",
              params: { status: 'chicken' }

        expect(response).not_to be_successful
        expect(response.status).to eq(400)
      end
    end
  end
end
