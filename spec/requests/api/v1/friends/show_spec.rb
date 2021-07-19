require 'rails_helper'

describe 'User Friends show' do
  describe 'User Friends Show' do
    describe  'Happy path' do
      it 'sends a user friends with gifts', :vcr do
        user = create :user
        friend = create :friend, birthday: '1989-09-29', user: user
        create :gift, status: 0,  friend: friend, name: "nintendo"
        create :gift, status: 0,  friend: friend, name: "napkins"
        create :gift, status: 0,  friend: friend, name: "table"
        create :gift, status: 0,  friend: friend, name: "chair"


        get "/api/v1/users/#{user.id}/friends/#{friend.id}"
        friend = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(friend).to be_a Hash
        expect(friend[:data]).to have_key(:attributes)
        expect(friend[:data][:attributes]).to have_key(:name)
        expect(friend[:data][:attributes]).to have_key(:memo)
        expect(friend[:data][:attributes]).to have_key(:birthday)
        expect(friend[:data][:attributes]).to have_key(:id)
        expect(friend[:included].first[:attributes]).to have_key(:name)
        expect(friend[:included].first[:attributes]).to have_key(:description)
        expect(friend[:included].first[:attributes]).to have_key(:status)
      end
    end

    describe  'Sad path' do
      it 'throws error if Specific friend does not exist', :vcr do
        user = create :user
        friend = create :friend, birthday: '1989-09-29', user: user
        friend2 = create :friend, birthday: '1989-09-29', user: user


        get "/api/v1/users/#{user.id}/friends/10"

        expect(response).to_not be_successful
        expect(response.status).to eq(404)
      end
    end
  end
end
