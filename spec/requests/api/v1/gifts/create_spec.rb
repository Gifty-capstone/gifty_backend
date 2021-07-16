require 'rails_helper'

RSpec.describe 'Create Gift - POST api/v1/gifts' do
  before :each do
    @user = create :user
    @friend1 = create :friend, birthday: '1989-09-29', user: @user
  end

  describe 'happy path' do
    it 'creates a gift with correct params' do
      gift1 = create :gift, status: 0, friend: @friend1

      post "/api/v1/users/#{@user.id}/friends/#{@friend1.id}/gifts",

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

    describe 'sad path' do
      it 'return an error if any attribute is missing' do
        params= { 'name': '',
                  'description': "description",
                  'status': 'pending' }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users/#{@user.id}/friends/#{@friend1.id}/gifts", headers: headers, params: JSON.generate(gift: params)

        expect(response).not_to be_successful
        expect(response.status).to eq(400)
      end

      it 'should ignore any attributes sent by the user which are not allowed' do
        params= { 'name': 'Guitar',
                  'description': "description",
                  'cost': 12,
                  'status': 'pending' }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users/#{@user.id}/friends/#{@friend1.id}/gifts", headers: headers, params: JSON.generate(gift: params)

        friend_created = Friend.last

        expect(response).not_to be_successful
        expect(friend_created).not_to have_attribute(:extra_param)
      end
    end
  end
end
