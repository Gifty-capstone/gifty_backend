require 'rails_helper'

RSpec.describe 'Etsy Facade' do
  it 'returns an array of 3 product objects', :vcr do
    response = EtsyFacade.product('nintendo')
    expect(response).to be_an(Array)
    expect(response.first).to be_a(Product)
    expect(response.count).to eq(3)
  end
end
