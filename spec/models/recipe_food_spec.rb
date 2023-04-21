require 'rails_helper'
RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'test@example.com', password: '12345678') }
  let(:food) { Food.create(name: 'chicken', measurement_unit: 'cups', quantity: '1', price: '20', user:) }
  let(:recipe) do
    Recipe.create(name: 'rissoto', preparation_time: '10', cooking_time: '5', description: '2', public: true, user:)
  end
  let(:recipe_food) { RecipeFood.create(quantity: '1', recipe_id: recipe.id, food:) }

  it 'recipe_food should be valid' do
    puts recipe.attributes
    expect(recipe_food).to be_valid
  end

  it 'recipe_food should be invalid if quantity is not a positive integer' do
    recipe_food.quantity = -8
    expect(recipe_food).to_not be_valid
  end
end
