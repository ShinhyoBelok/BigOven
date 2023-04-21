FactoryBot.define do
  factory :food do
    name { Faker::Name }
    measurement_unit { 'cups' }
    price { 100 }
    quantity { 2 }
    association :user, factory: :user
  end
end
