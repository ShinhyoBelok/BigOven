require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.new(
      name: 'Rice',
      measurement_unit: 'cups',
      price: 1,
      quantity: 10
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be as input' do
    subject.name = 'Rice'
    expect(subject).to_not be_valid
  end

  it 'measurement unit should be as input' do
    subject.measurement_unit = 'cups'
    expect(subject).to_not be_valid
  end

  it 'price and quantity should be as input and numbers' do
    subject.price = 1
    subject.quantity = 10
    expect(subject).to_not be_valid
  end
end
