require 'rails_helper'

describe UsersController, :type => :controller do
  let (:test_user) {FactoryGirl.create :user}
  describe "#new" do
    it "redirects to the posts home page upon save" do
      get :new, user: FactoryGirl.attributes_for(:user)
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "redirects to the posts home page upon save" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to posts_path
    end
  end

  describe "#show" do
    it "shows a user all of their 'likes'" do
      session[:user_id] = test_user.id
      get :show, id: test_user.id
      expect(assigns(:votes)).to eq(test_user.votes)
    end
  end
end

