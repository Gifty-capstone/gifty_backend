require 'rails_helper'

RSpec.describe Product do
  describe 'it encapsulates and returns product' do
    it 'returns the elevation object with an elevation attribute' do
      product_info = 
        {"listing_id":897556493,
        "state":"active",
        "user_id":374469014,
        "category_id":nil,
        "title":"Mew Emotes, Pokemon (Twitch\/Discord)",
        "description":"pokemon",
        "creation_tsz":1626702783,
        "ending_tsz":1637333583,
        "original_creation_tsz":1604378971,
        "last_modified_tsz":1626702783,
        "price":"10.00",
        "currency_code":"USD",
        "quantity":891,
        "sku":[],
        "tags":["pokemon","emote","twitch","discord","mew","nintendo"],
        "materials":[],
        "shop_section_id":31916934,
        "featured_rank":nil,
        "state_tsz":1604378972,
        "url":"https:\/\/www.etsy.com\/listing\/897556493\/mew-emotes-pokemon-twitchdiscord?utm_source=gifty&utm_medium=api&utm_campaign=api",
        "views":2059,
        "num_favorers":449,
        "shipping_template_id":nil,
        "processing_min":nil,
        "processing_max":nil,
        "who_made":"i_did",
        "is_supply":"false",
        "when_made":"2020_2021",
        "item_weight":nil,
        "item_weight_unit":"g",
        "item_length":nil,
        "item_width":nil,
        "item_height":nil,
        "item_dimensions_unit":"mm",
        "is_private":false,
        "recipient":nil,
        "occasion":nil,
        "style":nil,
        "non_taxable":false,
        "is_customizable":false,
        "is_digital":true,
        "file_data":"1 ZIP",
        "should_auto_renew":true,
        "language":"en-US",
        "has_variations":false,
        "taxonomy_id":77,
        "taxonomy_path":["Art & Collectibles","Drawing & Illustration","Digital"],
        "used_manufacturer":false,
        "is_vintage":false}
      
      product = Product.new(product_info, "nintendo")

      expect(product.keyword).to eq("nintendo")
      expect(product.name).to eq("Mew Emotes, Pokemon (Twitch/Discord)")
      expect(product.cost).to eq("10.00")
      expect(product.description).to eq("pokemon")
      expect(product.product_url).to eq("https:\/\/www.etsy.com\/listing\/897556493\/mew-emotes-pokemon-twitchdiscord?utm_source=gifty&utm_medium=api&utm_campaign=api")
    end
  end
end
