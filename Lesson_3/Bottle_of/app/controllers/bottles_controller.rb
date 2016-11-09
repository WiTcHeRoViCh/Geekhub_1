class BottlesController < ApplicationController
  before_action :current_bottle, only: [:show, :edit, :update, :destroy]

  def index
     @bottles = Bottle.all
  end

  def new
     @bottle = Bottle.new
  end

  def create
     @bottle = Bottle.new(bottle_params)
     if @bottle.save
     	redirect_to @bottle
     else
        render "new"
     end   	
  end	

  def show
  
  end

  def edit
  
  end

  def update
     @bottle.update_attributes(bottle_params)
     if @bottle.errors.empty?
     	redirect_to @bottle
     else
        render "edit"
    end
        	
  end
  
  def destroy
     @bottle.destroy
     redirect_to bottles_path
  end

  private

  def bottle_params
     params.require(:bottle).permit(:name, :price)
  end

  def current_bottle
     @bottle = Bottle.where(id: params[:id]).first
  end	

end