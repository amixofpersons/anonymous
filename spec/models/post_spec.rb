require 'rails_helper'

describe Post do
  let(:user) { User.create(name: 'waffles', email: 'idk@gmail.com', password: 'password123')}
  let(:new_post) { Post.new(title: "Test Post", body: "blah blah blah blah")}

  it 'should save new Post instances to the database with valid input' do
    new_post.poster = user
    expect(new_post.save).to eq true
    expect(Post.all.count).to eq 1
  end

  

end
