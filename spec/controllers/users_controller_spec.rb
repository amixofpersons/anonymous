require 'rails_helper'

describe UsersController, :type => :controller do
  it "redirects to the posts home page upon save" do
    get :new, user: FactoryGirl.attributes_for(:user)
    expect(response).to render_template(:new)
  end

  it "redirects to the posts home page upon save" do
    post :create, user: FactoryGirl.attributes_for(:user)
    expect(response).to redirect_to posts_path
  end
end

