require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let(:user) {FactoryGirl.create :user}
  it "loads the page" do
    expect(response).to be_success
  end

  describe "create" do
    it "creates a new session" do
    post :create, session: {user_name: user.name, user_password: user.password}
    expect(response).to redirect_to root_path
    end
  end

  describe "create" do
    it "doesn't creates a new session with invalid fields" do
    post :create, name: "Troll", password: "trolololoololoololo"
    expect(response).to redirect_to sessions_path
    end
  end
end
