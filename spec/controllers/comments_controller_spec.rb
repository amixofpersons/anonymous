require 'rails_helper'

describe CommentsController do
  let (:test_post) {FactoryGirl.create :post}
  let (:test_user) {FactoryGirl.create :user}
  let (:test_comment) {FactoryGirl.create :comment}

  context "new" do
    it "is successful" do
      get :new, :post_id =>test_post.id
      expect(response).to be_success
      end

    it "assigns @comment to the Comment found by id" do
      get :new, :post_id =>test_post.id
      expect(assigns(:comment)).to be_a_new Comment
    end
  end

  context "#create" do
    it "creates with valid attributes" do
      expect {
        session[:user_id] = test_user.id
        post :create, :post_id => test_post.id, :comment => FactoryGirl.attributes_for(:comment)
      }.to change {Comment.count}.by(1)
      expect(response).to be_redirect
    end

end

end
