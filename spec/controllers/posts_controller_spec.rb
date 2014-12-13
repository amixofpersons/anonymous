require 'rails_helper'

describe PostsController do
  let (:test_post) {FactoryGirl.create :post}
  let (:test_user) {FactoryGirl.create :user}

  it 'should save new Post instances to the database with valid input' do
    expect {
    post :create, user_id: test_user.id, post: {title: 'my title', body: 'my body text'}
    }.to change {Post.count}.by(1)
  end
end
