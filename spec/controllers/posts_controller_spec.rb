require 'rails_helper'

describe PostsController do
  let (:test_post) {FactoryGirl.create :post}
  let (:test_user) {FactoryGirl.create :user}

  describe "#create" do
    it 'should save new Post instances to the database with valid input' do
      expect {
      session[:user_id] = test_user.id
      post :create, user_id: test_user.id, post: {title: 'my title', body: 'my body text'}
      }.to change {Post.count}.by(1)
    end

    it 'should belong to a user' do
      session[:user_id] = test_user.id
      post :create, user_id: test_user.id, post: {title: 'my title', body: 'my body text'}
      expect(assigns(:post).poster).to eq test_user
    end
  end
end
