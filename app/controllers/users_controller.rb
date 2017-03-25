class UsersController < ApplicationController
  before_action :set_user,        only: [:show, :edit, :update, :destroy]
  before_action :is_current_user, only: [       :edit,          :destroy]

  def home
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find_by_id(params[:id])
    if !logged_in?
      redirect_to root_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.create(user_params)
    redirect_to users_path
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    def is_current_user
      @user = User.find_by_id(params[:id])
      if @user != current_user
        redirect_to root_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :city, :email, :password, :avatar)
    end
end
