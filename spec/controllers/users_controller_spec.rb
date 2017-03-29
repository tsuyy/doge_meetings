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
    it "deletes the user" do
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

  describe 'PUT #update' do
    before :each do
      user = FactoryGirl.create(:user, name: "Lawrence", city: "San Francisco", email: "a@b.com", password: "123")
    end
    
    context "valid attributes" do
      it "located the requested user" do
        user = FactoryGirl.create(:user, name: "Lawrence", city: "San Francisco", email: "a@b.com", password: "123")
        put :update, id: user.id, user: FactoryGirl.attributes_for(:user)
        assigns(:user).should eq(user)      
      end
      it "changes user's attributes" do
        user = FactoryGirl.create(:user, name: "Lawrence", city: "San Francisco", email: "a@b.com", password: "123")
        put :update, id: user, 
          user: FactoryGirl.attributes_for(:user, name: "Larry", city: "San Francisco", email: "a@b.com", password: "123")
        user.reload
        user.name.should eq("Larry")
        user.city.should eq("San Francisco")
      end
      it "redirects to the updated user" do
        user = FactoryGirl.create(:user, name: "Larry", city: "San Francisco", email: "a@b.com", password: "123")
        put :update, id: user.id, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to user
      end
    end
    
    context "invalid attributes" do
      it "locates the requested user" do
        user = FactoryGirl.create(:user, name: "Lawrence", city: "San Francisco")
        put :update, id: user.id, user: FactoryGirl.attributes_for(:invalid_user)
        assigns(:user).should eq(user)      
      end
      it "does not change user's attributes" do
        user = FactoryGirl.create(:user, name: "Lawrence", city: "San Francisco")
        put :update, id: user, 
          user: FactoryGirl.attributes_for(:user, name: "Larry", city: nil)
        user.reload
        user.name.should_not eq("Larry")
        user.city.should eq("San Francisco")
      end     
      it "re-renders the edit method" do
        user = FactoryGirl.create(:user, name: "Lawrence", city: "San Francisco")
        put :update, id: user.id, user: FactoryGirl.attributes_for(:invalid_user)
        response.should render_template :edit
      end
    end
  end
end