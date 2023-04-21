require 'rails_helper'

RSpec.describe 'recipes/show.html.erb', type: :feature do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'test@example.com', password: '12345678') }
  before(:each) do
    user.confirm
    sign_in user
    @recipe = Recipe.create(name: 'rissoto', preparation_time: '10', cooking_time: '5',
                            description: 'test description', public: true, user:)
    @food = Food.create(name: 'chicken', measurement_unit: 'cups', quantity: '1', price: '20', user:)
    @recipe_food = RecipeFood.create(quantity: '1', recipe_id: @recipe.id, food_id: @food.id)
    visit recipe_path(@recipe.id)
  end

  it 'Shows the recipes the user has created' do
    expect(page).to have_content('Recipe')
  end

  it 'Shows preparation time for the recipe' do
    expect(page).to have_content(@recipe.preparation_time)
  end

  it 'Shows cooking time for the recipe' do
    expect(page).to have_content(@recipe.cooking_time)
  end

  it 'Shows table of ingredients' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Value')
    expect(page).to have_content('Actions')
    expect(page).to have_content(@recipe_food.food.name)
    expect(page).to have_content(@recipe_food.food.quantity)
    expect(page).to have_content(@recipe_food.food.price * @recipe_food.quantity)
    expect(page).to have_content('Delete')
    expect(page).to have_content('Update')
  end

  it 'redirects me to my recipes' do
    link = find("a[href='#{recipes_path}']")
    link.click
    expect(page).to have_current_path(recipes_path)
  end

  it 'redirects me to add ingredient' do
    link = find("a[href='#{new_recipe_recipe_food_path(@recipe)}']")
    link.click
    expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe))
  end
end
