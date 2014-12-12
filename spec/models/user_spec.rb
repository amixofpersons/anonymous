require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user))
  end

  it 'should save new User instances to the database with valid input' do
    new_user = FactoryGirl.create(:user)
    expect(new_user.save).to eq true
    expect(User.all.count).to eq 1
  end

end
