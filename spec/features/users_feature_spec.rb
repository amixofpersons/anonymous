require 'rails_helper'

feature 'User management' do
  scenario 'Can create a new user' do
    visit users_path

    fill_in 'Name', with: 'lulu'
    fill_in 'Email', with: 'ghoul@2spooky.com'
    fill_in 'Password', with: 'ghoul'
    fill_in 'Password confirmation', with: 'ghoul'

    expect{
      click_button 'Create User'
    }.to change(User, :count)
  end

  scenario "Doesn't create a user if there are incorrectly filled fields" do
    visit users_path

    fill_in 'Name', with: 'lulu'
    fill_in 'Email', with: 'ghoul@2spooky.com'
    fill_in 'Password', with: 'ghoul'
    fill_in 'Password confirmation', with: 'bats'

    expect{
      click_button 'Create User'
    }.to_not change(User, :count)
  end
end

