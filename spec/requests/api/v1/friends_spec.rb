require 'rails_helper'

RSpec.describe "Api::V1::Friends", type: :request do
  # before :each do
  #   @friend_1 = create(:friend)
  #   create_list(:friend, 3)
  # end

  describe "GET /index" do
    it 'return all friends' do
      get '/api/v1/friends'
      expect(response).to be_successful
    end

    # it 'can return a specific friend by id' do
    #   get "/api/v1/friends/#{@friend_1.id}"
    #   expect(response).to be_successful
    # end
  end
end
