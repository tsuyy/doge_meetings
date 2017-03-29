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
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(response).to have_http_status(200)
    end
    it "renders the #show view" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(response).to render_template :show
    end
    it "redirects to login_path if not logged in" do
      user = FactoryGirl.create(:user)
      User.stub(:find).and_return(user)
      get :show, id: user
      expect(response).to redirect_to(login_path)
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      user = FactoryGirl.create(:user)
      get :edit, id: user.id
      expect(response).to have_http_status(200)
    end
    it "renders the #edit view" do
      user = FactoryGirl.create(:user)
      User.stub(:find).and_return(user)
      get :edit, id: user
      expect(response).to render_template :edit
    end
    it "redirects to login_path if not current_user" do
      user = FactoryGirl.create(:user)
      User.stub(:find).and_return(user)
      get :edit, id: user
      expect(response).to redirect_to(login_path)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User,:count).by(1)
      end
      
      it "redirects to the new user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to User.last
      end
    end
    context "with invalid attributes" do
      it "does not save the new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:invalid_user)
        }.to_not change(User,:count)
      end
      it "re-renders the new method" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user)
        response.should render_template :new
      end
    end 
  end

  describe 'DELETE #destroy' do
    it "deletes the contact" do
      user = FactoryGirl.create(:user)
      expect{
        delete :destroy, id: user.id      
      }.to change(User,:count).by(-1)
    end
      
    it "redirects to login page" do
      user = FactoryGirl.create(:user)
      delete :destroy, id: user.id
      response.should redirect_to login_path
    end
  end

end