require 'rails_helper'

RSpec.describe 'Create Friend' do
  before :each do
    @user = create :user
  end

  describe 'happy path' do
    it 'creates a friend with correct params' do
      post "/api/v1/users/#{@user.id}/friends",
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

    describe 'sad path' do
      it 'return an error if any attribute is missing' do

        params= { 'name': '',
                  'birthday': "",
                  'memo': 'pending' }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users/#{@user.id}/friends", headers: headers, params: JSON.generate(friend: params)

        expect(response).not_to be_successful
        expect(response.status).to eq(400)
      end

      it 'should ignore any attributes sent by the user which are not allowed' do
        params= { 'name': 'Harry',
                  'birthday': "description",
                  'email': 'email@.com',
                  'memo': 'loves magic' }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users/#{@user.id}/friends", headers: headers, params: JSON.generate(friend: params)
      end
    end
  end
end
