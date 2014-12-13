require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  it "renders the login page" do
    expect(response).to be_success
  end

  it "signs in a user if fields are filled correctly" do
    post :create, user: FactoryGirl.attributes_for(:user)
    expect(response).to redirect_to posts_path
  end

  it "doesn't sign in a user if fields are filled incorrectly" do
  end
end
