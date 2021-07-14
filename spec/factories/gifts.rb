FactoryBot.define do
  factory :gift do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
  end
end
