class FruitsController < ApplicationController
  before_action :current_fruit, only: [:show, :edit, :update, :destroy]

  def index
  	@fruits = Fruit.all
  end

  def show

  end

  def new
  	@fruit = Fruit.new
  end

  def create
  	@fruit = Fruit.new(fruit_params)
  	if @fruit.save
  		redirect_to @fruit
  	else
  	  render :new
  	end  	
  end

  def edit
  end

  def update
  	if @fruit.update(fruit_params)
  		redirect_to @fruit
  	else
  	  render :new
  	end  	
  end

  def destroy
  	@fruit.destroy
  	redirect_to fruits_path
  end

  private

  def current_fruit
  	@fruit = Fruit.find(params[:id])
  end

  def fruit_params
  	params.require(:fruit).permit(:name, :price)
  end
end
