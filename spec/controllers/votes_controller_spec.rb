require 'rails_helper'

describe VotesController do
  let (:test_user) {FactoryGirl.create :user}
  let (:test_post) {FactoryGirl.create :post}
  describe "#create" do
    it "should create a new vote" do
      session[:user_id] = test_user.id
      expect{
        post :create,
        post_id: test_post.id
      }.to change {Vote.count}.by (1)
    end

    it "should associate a vote with a post" do
      session[:user_id] = test_user.id
      post :create, post_id: test_post.id
      expect(assigns(:vote).votable).to eq(test_post)
    end
  end
end