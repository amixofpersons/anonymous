require 'rails_helper'

describe VotesController do
  let (:test_user) {FactoryGirl.create :user}
  let (:test_post) {FactoryGirl.create :post}
  describe "#create" do
    it "should create a new vote" do
      session[:user_id] = test_user.id
      expect{
        post :create,
        post_id: test_post.id,
        user_id: test_user.id
      }.to change {Vote.count}.by (1)
    end
  end
end