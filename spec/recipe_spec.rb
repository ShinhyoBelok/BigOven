require 'rails_helper'
RSpec.describe Recipe, type: :model do
  subject { FactoryBot.create(:recipe) }

  before do
  end

  it 'recipe should be valid' do
    expect(subject).to be_valid
  end

  it 'if name is not present, recipe must not be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'if preparation_time is not a integer number, recipe must not be valid' do
    subject.preparation_time = -8.2
    expect(subject).to_not be_valid
  end

  it 'if cooking_time is not a integer number, recipe must not be valid' do
    subject.cooking_time = -8.2
    expect(subject).to_not be_valid
  end
end