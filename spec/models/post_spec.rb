require 'rails_helper'

describe Post do
  it 'should save new Post instances to the database with valid input' do
    new_post = FactoryGirl.create(:user).posts.create(title: "test", body: "idk")
    expect(new_post.save).to eq true
    expect(Post.all.count).to eq 1
  end

end
