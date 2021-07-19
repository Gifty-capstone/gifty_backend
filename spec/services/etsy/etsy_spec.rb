require 'rails_helper'

RSpec.describe "Etsy", type: :request do
  describe "return product info" do
    it "returns products from etsy", :vcr do
      results = EtsyService.get_product("nintendo")
      expect(results).to be_a(Hash)
      expect(results.count).to eq(5)
    end
  end
end
