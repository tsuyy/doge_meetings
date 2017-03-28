require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET #new" do
    it "initializes a new user" do
      user = User.new
      expect(user).to be_a(User)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the #show view" do
      get :show, id: FactoryGirl.build(:user)
      expect(response).to render_template :show
    end
  end

end