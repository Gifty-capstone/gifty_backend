FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
