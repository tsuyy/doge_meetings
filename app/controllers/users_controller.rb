class UsersController < ApplicationController
  # The first line of is_current_user does the same thing as set_user. you should never need to use both on a single route.
  before_action :set_user,        only: [:show]
  before_action :is_current_user, only: [:edit, :update, :destroy]

  def home
  end

  # DEAD CODE :(
  # GET RID OF THE CODE FOR NOT REAL ROUTES.

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
    # logically, creating @user belongs after these if/elsif checks.
    @user = User.new(user_params)
    if params[:user][:password_confirmation] != user_params[:password]
      flash[:error] = "Passwords don't match"
      redirect_to new_user_path
    elsif user_params[:password].empty?
      flash[:error] = "Please Enter a Password"
      redirect_to new_user_path
    else
      # here.
      if @user.save
        log_in(@user)
        flash[:success] = "User created successfully!"
        redirect_to user_path(@user)
      else
        flash[:error] = "Not Valid Account Info"
        # more helpful error message, and take them back to create account w/ their information still filled in.
        # could use @saved_user.
        redirect_to root_path
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    # i SURE HOPE that this is what set_user the hook is doing already. so this line is unnecessary.
    @user = User.find_by_id(params[:id])
    # wouldn't it be nice if you abstracted this into some private helper method
    if params[:user][:password_confirmation] != user_params[:password]
      flash[:error] = "Passwords don't match"
      redirect_to edit_user_path(@user)
    elsif user_params[:password].empty?
      flash[:error] = "Please Enter a Password"
      redirect_to edit_user_path(@user)
    else
      @user.update(user_params)
      # you're not checking if that actually worked, you're just saying "success"
      flash[:success] = "Updated"
      redirect_to user_path(@user)
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    flash[:success] = "User deleted successfully"
    redirect_to root_path
  end

  private
    # commented out code... GET RID OF IT.

    # handbuilt presence
    # def check_params
    #   ans = user_params.clone
    #   user_params.each do |param|
    #     next if param == "avatar"
    #     flash[:error] = "Can't Have Only Spaces in Form"
    #     ans = nil if user_params[param].delete(" ").empty?
    #   end
    #   redirect_to root_path if ans == nil
    # end

    def is_current_user
      @user = User.find_by_id(params[:id])
      if @user != current_user
        redirect_to root_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      # not safe if you put in a user id that's nonexistent.
      # which will give you the sad default rails 404.
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :city, :email, :password, :avatar)
    end
end
