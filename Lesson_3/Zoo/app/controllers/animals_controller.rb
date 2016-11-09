class AnimalsController < ApplicationController
  before_action :current_animal, only: [:show, :edit, :update, :destroy]

  def index
  	@animals = Animal.all
  end

  def show
  end

  def new
  	@animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
    	redirect_to @animal
    else	
    	render :new
    end	
  end	

  def edit
  end

  def update
    @animal.update_attributes(animal_params)
    if @animal.errors.empty?
    	redirect_to @animal
    else
      render :edit
    end  	
  end	

  def destroy
    @animal.delete
    redirect_to animals_path
  end	

  private

  def animal_params
    params.require(:animal).permit(:name, :price)
  end	

  def current_animal
    @animal = Animal.where(id: params[:id]).first
  end	
end