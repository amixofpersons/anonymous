require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  it "loads the page" do
    get :new, user: FactoryGirl.attributes_for(:user)
    expect(response).to be_success
  end
end
