class DogsController < ApplicationController
  before_action :set_dog,         only: [:edit, :destroy, :update]
  before_action :is_current_user, only: [:edit, :destroy, :update]

  def index
    @dogs = Dog.all
  end

  def new
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
    @dog = Dog.new(user_id: params[:user_id])
  end

  def create
    # this likes you're re-creating is_current_user for the create action.
    # you should use the same hook, or a hook, to check this.
    # you could also just always save to the current user. you don't really
    # need the user in your path in that case.
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
    dog = dog_params
    dog[:user_id] = params[:user_id]
    @dog = Dog.new(dog)
    if @dog.save
      redirect_to user_path(current_user)
    else
      # this is not a helpful error message.
      flash[:error] = "Wrong dog parameters"
      redirect_to user_path(current_user)
    end
  end

  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to user_path(@dog.user)
  end

  def destroy
    @dog.destroy
    flash[:success] = "Oh no! What happened to your dog?"
    redirect_to user_path(@dog.user)
  end

  private
  def is_current_user
    @dog = Dog.find_by_id(params[:id])
    if !current_user || current_user != @dog.user
      redirect_to root_path
    end
  end

  def set_dog
    # doesn't handle if the dog doesn't exist/the ID is wrong. breaks.
    @dog = Dog.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def dog_params
    params.require(:dog).permit(:name, :age, :sex, :breed, :vaccinated, :neutered, :weight, :temperament, :avatar, :user_id)
  end

end
