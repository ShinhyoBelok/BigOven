require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'test@example.com', password: '12345678') }
  before(:each) do
    user.confirm
    sign_in user
    @recipe = Recipe.create(name: 'rissoto', preparation_time: '10', cooking_time: '5',
                            description: 'test description', public: true, user:)
    @recipe2 = Recipe.create(name: 'Soup', preparation_time: '10', cooking_time: '5',
                             description: 'text description 2', public: true, user:)
    visit recipes_path
  end

  it 'Shows the recipes the user has created' do
    expect(page).to have_content('My Recipes')
  end

  it 'Shows the name of the recipes' do
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe2.name)
  end

  it 'Shows the description of the recipes' do
    expect(page).to have_content(@recipe.description)
    expect(page).to have_content(@recipe2.description)
  end

  it 'Shows the delete btn' do
    expect(page).to have_content('Delete')
  end

  it 'redirects me to a specif recipe' do
    link = find("a[href='#{recipe_path(@recipe.id)}']")
    link.click
    expect(page).to have_current_path(recipe_path(@recipe.id))
  end

  it 'redirects me to a add another recipe' do
    link = find("a[href='#{new_recipe_path(user)}']")
    link.click
    expect(page).to have_current_path(new_recipe_path(user))
  end

  it 'redirects me to public recipes' do
    link = find("a[href='#{public_recipes_path}']")
    link.click
    expect(page).to have_current_path(public_recipes_path)
  end
end
