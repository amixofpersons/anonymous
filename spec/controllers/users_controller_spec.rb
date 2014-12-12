require 'rails_helper'

describe UsersController, :type => :controller do
  it "redirects to the home page upon save" do
    post :create, user: FactoryGirl.attributes_for(:user)
    expect(response).to redirect_to posts_path
  end
end

