require 'rails_helper'

RSpec.describe 'Destroy Gift - DELETE api/v1/gifts' do
  describe 'happy path' do
    it 'destroys a gift ' do
      user = create :user
      friend1 = create :friend, birthday: '1989-09-29', user: user
      gift1 = create :gift, status: 0, friend: friend1

      delete "/api/v1/users/#{user.id}/friends/#{friend1.id}/gifts/#{gift1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)

      expect(Gift.count).to eq(0)
    end

    describe 'sad path' do
      it 'cant destroys a gift that doesnt exisit' do
        user = create :user
        friend1 = create :friend, birthday: '1989-09-29', user: user
        gift1 = create :gift, status: 0, friend: friend1

        delete "/api/v1/users/#{user.id}/friends/#{friend1.id}/gifts/5"

        expect(response).to_not be_successful
        expect(response.status).to eq(404)
      end
    end
  end
end
