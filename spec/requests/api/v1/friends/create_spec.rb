require 'rails_helper'

RSpec.describe 'Create Friend' do
  describe 'happy path' do
    it 'creates a friend with correct params' do
      user = create :user
      post "/api/v1/users/#{user.id}/friends",
      params: { name: "Joey",
                birthday: "1989-09-29",
                memo: "This is a test "}
      friend = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(friend[:data][:attributes]).to have_key(:name)
      expect(friend[:data][:attributes]).to have_key(:memo)
      expect(friend[:data][:attributes]).to have_key(:birthday)
      
      expect(Friend.count).to eq(1)
    end
  end
end
