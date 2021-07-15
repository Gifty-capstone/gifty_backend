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
end