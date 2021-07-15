require 'rails_helper'

describe 'User Friends show' do
  describe 'User Friends Show' do 
    describe  'Happy path' do 
      it 'sends a user friends with gifts' do
        user = create :user
        friend = create :friend, birthday: '1989-09-29', user: user
        create :gift, status: 0,  friend: friend
        create :gift, status: 0,  friend: friend
        create :gift, status: 0,  friend: friend
        create :gift, status: 0,  friend: friend

        
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
  end
end