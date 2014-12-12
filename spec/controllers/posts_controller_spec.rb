require 'rails_helper'

describe PostsController do
  xit 'should save new Post instances to the database with valid input' do
    new_user = FactoryGirl.create(:user)
    post :create, post: FactoryGirl.attributes_for(:post, user_id: new_user.id)
    expect(response).to redirect_to post_path
  end
end
