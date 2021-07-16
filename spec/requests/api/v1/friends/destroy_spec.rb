require 'rails_helper'

RSpec.describe 'Destroy Friend' do
  describe 'happy path' do
    it 'destroys a friend ' do
      user = create :user
      friend = create :friend, user: user

      delete "/api/v1/users/#{user.id}/friends/#{friend.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)

      expect(Friend.count).to eq(0)
    end
  end

  describe 'sad path' do
    it 'cant destroys a friend that doesnt exisit' do
      user = create :user
      friend1 = create :friend, birthday: '1989-09-29', user: user

      delete "/api/v1/users/#{user.id}/friends/5"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
