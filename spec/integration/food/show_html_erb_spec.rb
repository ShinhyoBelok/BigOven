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
    visit food_path(@oats)
  end

  it 'Shows the foods table' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Measurement unit')
    expect(page).to have_content('Unit price')
    expect(page).to have_content('Quantity')
  end

  it 'Shows the name of the foods' do
    expect(page).to have_content(@oats.name)
  end

  it 'Shows the measurement unit of the foods' do
    expect(page).to have_content(@oats.measurement_unit)
  end

  it 'Shows the unit price of the foods' do
    expect(page).to have_content(@oats.price)
  end

  it 'Shows the quantity of the foods' do
    expect(page).to have_content(@oats.quantity)
  end
end
