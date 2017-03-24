class DogsController < ApplicationController
  before_action :set_dog, only: [:edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new(user_id: params[:user_id])
  end

  def create
    dog = dog_params
    dog[:user_id] = params[:user_id]
    @dog = Dog.create(dog)
    redirect_to user_path(@dog.user)
  end

  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to user_path(@dog.user)
  end

  def destroy
    @dog.destroy
    redirect_to user_path(@dog.user)
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def dog_params
    params.require(:dog).permit(:name, :age, :sex, :breed, :vaccinated, :neutered, :weight, :temperament, :avatar, :user_id)
  end

end
