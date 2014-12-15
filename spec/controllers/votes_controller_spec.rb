require 'rails_helper'
describe VotesController do
  let (:test_user) {FactoryGirl.create :user}
  let (:test_post) {FactoryGirl.create :post}
  let (:test_comment) {test_user.comments.create(FactoryGirl.attributes_for :comment)}
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

    it "should associate a vote with a comment" do
      session[:user_id] = test_user.id
      test_post.comments << test_comment
      post :create, comment_id: test_comment.id
      expect(assigns(:vote).votable).to eq(test_comment)
    end

    it "should associate a vote with current user" do
      session[:user_id] = test_user.id
      post :create, post_id: test_post.id
      expect(assigns(:vote).user).to eq(test_user)
    end

    it "should prevent voting more than once" do
      session[:user_id] = test_user.id
      post :create, post_id: test_post.id
      expect{
        post :create, post_id: test_post.id
        }.to_not change {Vote.count}
    end
  end
end
