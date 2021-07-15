require 'rails_helper'

RSpec.describe "Api::V1::Gifts", type: :request do
  describe "GET /index" do
    it 'return all gifts' do
      create :user, id:1
      create :friend, id: 1
      get '/api/v1/users/1/friends/1/gifts'
      expect(response).to be_successful
    end
  end
end
