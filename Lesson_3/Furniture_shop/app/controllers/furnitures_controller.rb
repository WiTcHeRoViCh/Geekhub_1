class FurnituresController < ApplicationController
  before_action :find_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @furnitures = Furniture.all
  end

  def new
    @furniture = Furniture.new
  end

  def create
    @furniture = Furniture.create(user_params)
    if @furniture.errors.empty?
       redirect_to @furniture
    else
       render "new"
    end      
  end

  def show
     
  end

  def edit
    
  end

  def update
    @furniture.update_attributes(user_params)
    if @furniture.errors.empty?
       redirect_to @furniture
    else
       render "edit"
    end
          
  end

  def destroy
    
    @furniture.destroy
    if @furniture.errors.empty?
       redirect_to furnitures_path
    end

  end

  private

  def user_params 
     params.require(:furniture).permit(:name, :material, :price)
  end 

  def find_by_id
     @furniture = Furniture.where(id: params[:id]).first
  end 
end
