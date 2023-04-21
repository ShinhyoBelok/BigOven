require 'rails_helper'

RSpec.describe 'Food Index', type: :feature do
  let(:user) { User.create(name: 'jinx', email: 'test4@example.com', password: 'abc5678') }
  before(:each) do
    user.confirm
    sign_in user
    @oats = Food.create(
      name: 'oats',
      measurement_unit: 'grams',
      price: 1,
      quantity: 10,
      user_id: user.id
    )

    @beans = Food.create(
      name: 'Beans',
      measurement_unit: 'grams',
      price: 2,
      quantity: 20,
      user_id: user.id
    )
    visit foods_path
  end

  it 'Shows the foods table' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Measurement unit')
    expect(page).to have_content('Unit price')
    expect(page).to have_content('Actions')
  end

  it 'Shows the name of the foods' do
    expect(page).to have_content(@oats.name)
    expect(page).to have_content(@beans.name)
  end

  it 'Shows the measurement unit of the foods' do
    expect(page).to have_content(@oats.measurement_unit)
    expect(page).to have_content(@beans.measurement_unit)
  end

  it 'Shows the unit price of the foods' do
    expect(page).to have_content(@oats.price)
    expect(page).to have_content(@beans.price)
  end

  it 'Shows the delete btn' do
    expect(page).to have_content('Delete')
  end

  it 'Redirects to my recipes' do
    btn = find_button('Back to recipes')
    btn.click
    expect(page).to have_current_path(recipes_path)
  end

  it 'Redirects to new food form' do
    btn = find_button('Add food')
    btn.click
    expect(page).to have_current_path(new_food_path)
  end
end
