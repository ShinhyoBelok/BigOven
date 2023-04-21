FactoryBot.define do
  factory :recipe_food do
    quantity { 5 }
    association :food, factory: :food
    association :recipe, factory: :recipe
  end
end
