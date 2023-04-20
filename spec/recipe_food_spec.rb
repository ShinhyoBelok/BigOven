require 'rails_helper'
RSpec.describe RecipeFood, type: :model do
  subject { FactoryBot.create(:recipe_food) }

  before do
    subject.save
  end

  it 'recipe_food should be valid' do
    expect(subject).to be_valid
  end

  it 'recipe_food should be invalid if quantity is not a positive integer' do
    subject.quantity = -8
    expect(subject).to_not be_valid
  end
end