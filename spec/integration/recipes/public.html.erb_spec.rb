require 'rails_helper'

RSpec.describe 'recipes/public.html.erb', type: :feature do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'test@example.com', password: '12345678') }
  before(:each) do
    user.confirm
    sign_in user
    @recipe = Recipe.create(name: 'rissoto', preparation_time: '10', cooking_time: '5',
                            description: 'test description', public: true, user:)
    @recipe2 = Recipe.create(name: 'Soup', preparation_time: '10', cooking_time: '5',
                             description: 'text description 2', public: true, user_id: 2)
    @food = Food.create(name: 'chicken', measurement_unit: 'cups', quantity: '1', price: '20', user:)
    @food_recipes = RecipeFood.create(quantity: '1', recipe_id: @recipe.id, food_id: @food.id)
    visit public_recipes_path
  end

  it 'Shows all recipes marked as public' do
    expect(page).to have_content('Public Recipes')
  end

  it 'Shows the creator of the recipe' do
    expect(page).to have_content(@recipe.user.name)
  end

  it 'Shows the total item for a recipe' do
    expect(page).to have_content(@recipe.recipe_foods.size)
  end

  it 'Shows the total cost for a recipe' do
    expect(page).to have_content(@recipe.recipe_foods.sum { |rf| rf.food.price * rf.quantity })
  end

  it 'redirects me to a specif recipe' do
    link = find("a[href='#{recipe_path(@recipe.id)}']")
    link.click
    expect(page).to have_current_path(recipe_path(@recipe.id))
  end

  it 'redirects me my recipes' do
    link = find("a[href='#{recipes_path}']")
    link.click
    expect(page).to have_current_path(recipes_path)
  end
end
