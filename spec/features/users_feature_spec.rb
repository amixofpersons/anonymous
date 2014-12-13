require 'rails_helper'

RSpec.describe "users/new.html.erb", :type => :view do
  context "on the signup page" do
    describe "the page" do
      xit "should take correct parameters" do
        visit

        fill_in 'Name', with: 'lulu'
        fill_in 'Email', with: 'ghoul@2spooky.com'
        fill_in 'Password', with: 'ghoul'
        fill_in 'Confirm Password', with: 'ghoul'

        click_button 'Create User'
        expect(response).to redirect_to root_path
      end
    end
  end
end
