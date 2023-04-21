FactoryBot.define do
  factory :recipe do
    name { Faker::Name }
    preparation_time { 2 }
    cooking_time { 5 }
    description { Faker::Quote }
    association :user, factory: :user
  end
end
