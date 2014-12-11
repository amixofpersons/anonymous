require 'rails_helper'

describe User do
  let(:new_user) { User.new(name: 'waffles', email: 'idk@gmail.com', password: 'password123')}
  it 'should save new User instances to the database with valid input' do
    expect(new_user.save).to eq true
    expect(User.all.count).to eq 1
  end
end
