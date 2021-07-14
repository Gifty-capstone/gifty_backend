require 'rails_helper'

RSpec.describe "Api::V1::Gifts", type: :request do
  describe "GET /index" do
    it 'return all gifts' do
      get '/api/v1/gifts'
      expect(response).to be_successful
    end
  end
end
