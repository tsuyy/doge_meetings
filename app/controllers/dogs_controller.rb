class DogsController < ApplicationController
  
  def index
    @dogs = Dog.all
  end

  def new
    @dogs = Dog.new
  end

end
