require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Jinx')
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be same as input' do
    subject.name = 'jinx'
    expect(subject).to_not be_valid
  end
end
