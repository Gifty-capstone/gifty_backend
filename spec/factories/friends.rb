FactoryBot.define do
  factory :friend do
    name { Faker::Name.first_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    icon { 1 }
    association :user
  end
end
