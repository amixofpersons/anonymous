require 'rails_helper'

describe Post do

  it 'should save new Post instances to the database with valid input' do
    new_post = FactoryGirl.create(:user).posts.create(title: "test", body: "idk")
    expect(new_post.save).to eq true
    expect(Post.all.count).to eq 1
  end

  it 'should be invalid if not associated with a user' do
    new_post = FactoryGirl.create(:post)
    new_post.valid?
    # expect(post.errors[:user_id]).to include("Poster can't be blank")
  end

end
