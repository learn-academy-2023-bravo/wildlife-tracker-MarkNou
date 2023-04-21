require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid without a common' do
    tiger = Animal.create( binomial:'Tigeroso')
    expect(tiger.errors[:common]).to_not be_empty
    p tiger.errors.full_messages
  end
  it 'is not valid without a binomial' do
    tiger = Animal.create(common:'Tiger')
    expect(tiger.errors[:binomial]).to_not be_empty
  end
  it 'common is unique' do
    tiger = Animal.create(common:'Tiger', binomial:'Tigeroso')
    tiger = Animal.create(common:'Tiger', binomial:'Tigeroso')
    expect(tiger.errors[:common]).to_not be_empty
  end
  it 'common cant be the same as binomial' do
    tiger = Animal.create(common:'Tiger', binomial:'Tiger')
    expect(tiger.errors[:common]).to_not be_empty
  end


end
  