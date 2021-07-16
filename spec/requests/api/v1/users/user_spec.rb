require 'rails_helper'

RSpec.describe 'User Registration Endpoint', type: :request do
  it 'can register a user', :vcr do
    body = {
      "name": "Dione Travis",
      "email": "Dione@example.com",
      "birthday": "2020-10-10"
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/users', headers: headers, params: body.to_json

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(user).to have_key(:id)
    expect(user[:id]).to be_a String
    expect(user).to have_key(:type)
    expect(user[:type]).to eq('user')
    expect(user).to have_key(:attributes)
    expect(user[:attributes]).to be_a(Hash)

    attributes = user[:attributes]
    expect(attributes).to have_key(:email)
    expect(attributes[:email]).to be_a(String)
    expect(attributes).to have_key(:birthday)
    expect(attributes[:birthday]).to be_a(String)
  end

  it 'can return an error with missing field' do
    body = {
      "email": "Dione@example.com",
      "birthday": "2020-10-10"
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/users', headers: headers, params: body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:name]).to eq(["can't be blank"])
  end
end
