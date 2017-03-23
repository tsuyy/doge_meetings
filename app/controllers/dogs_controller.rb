class DogsController < ApplicationController
  
  def index
    @dogs = Dog.all
  end

  def new
    @dogs = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
  end

  def edit
  end

  def update
    @dog.update(dog_params)
  end

  def destroy
    @dog.destroy
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def dog_params
    params.require(:dog).permit(:name, :age, :sex, :breed, :vaccinated, :neutered, :weight, :temperament, :image, :user_id)
  end

end
