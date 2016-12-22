class VegetablesController < ApplicationController
  before_action :current_vegetable, only: [:show, :edit, :update, :destroy]

  def index
  	@vegetables = Vegetable.all
  end

  def show

  end

  def new
  	@vegetable = Vegetable.new
  end

  def create
  	@vegetable = Vegetable.new(vegetable_params)
  	if @vegetable.save
  		redirect_to @vegetable
  	else
  	  render :new
  	end  	
  end

  def edit
  end

  def update
  	if @vegetable.update(vegetable_params)
  		redirect_to @vegetable
  	else
  	  render :new
  	end  	
  end

  def destroy
  	@vegetable.destroy
  	redirect_to vegetables_path
  end

  private

  def current_vegetable
  	@vegetable = Vegetable.find(params[:id])
  end

  def vegetable_params
  	params.require(:vegetable).permit(:name, :price)
  end
end
