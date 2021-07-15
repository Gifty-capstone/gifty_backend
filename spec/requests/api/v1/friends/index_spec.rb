require 'rails_helper'

describe 'User Friends' do
  describe 'User Friends All' do 
    describe  'Happy path' do 
      it 'sends all  of a users friends' do
        user1 = create :user
        friend1 = create :friend, birthday: '1989-09-29', user: user1
        gift1 = create :gift, status: 1, updated_at: '2021-10-10', friend: friend1
        friend2 = create :friend, birthday: '1989-09-29', user: user1
        gift2 = create :gift, status: 1, updated_at: '2021-05-15', friend: friend2
        friend3 = create :friend, birthday: '1989-09-29', user: user1
        gift3 = create :gift, status: 0, updated_at: '2021-05-15', friend: friend3
        
        get "/api/v1/users/#{user1.id}/friends"
        friends = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(friends).to be_a Hash
        expect(friends[:data]).to have_key(:attributes)
        expect(friends[:data][:attributes]).to have_key(:name)
        expect(friends[:data][:attributes]).to have_key(:email)
        expect(friends[:data][:attributes]).to have_key(:birthday)
        expect(friends[:included].count).to eq(3)
        expect(friends[:included].first[:attributes]).to have_key(:name)
        expect(friends[:included].first[:attributes]).to have_key(:birthday)
        expect(friends[:included].first[:attributes]).to have_key(:id)
        expect(friends[:included].first[:attributes]).to have_key(:need_gift)
      end
    end
  end
end