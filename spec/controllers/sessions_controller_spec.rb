require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  it "renders the login page" do
    expect(response).to be_success
  end

  it "redirects to the posts home page upon save" do
    post :create, user: FactoryGirl.attributes_for(:user)
    expect(response).to redirect_to posts_path
  end
end
