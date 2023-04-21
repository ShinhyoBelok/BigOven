require 'rails_helper'
RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'test@example.com', password: '12345678') }
  let(:food) { Food.create(name: 'chicken', measurement_unit: 'cups', quantity: '1', price: '20', user:) }
  let(:recipe) do
    Recipe.create(name: 'rissoto', preparation_time: '10', cooking_time: '5', description: '2', public: true, user:)
  end

  it 'recipe should be valid' do
    expect(recipe).to be_valid
  end

  it 'if name is not present, recipe must not be valid' do
    recipe.name = nil
    expect(recipe).to_not be_valid
  end

  it 'if preparation_time is not a integer number, recipe must not be valid' do
    recipe.preparation_time = -8.2
    expect(recipe).to_not be_valid
  end

  it 'if cooking_time is not a integer number, recipe must not be valid' do
    recipe.cooking_time = -8.2
    expect(recipe).to_not be_valid
  end
end
