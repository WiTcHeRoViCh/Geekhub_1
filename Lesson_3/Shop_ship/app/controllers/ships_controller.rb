class ShipsController < ApplicationController
  before_action :current_ship, only: [:show, :edit, :update, :destroy]

  def index
     @ships = Ship.all
  end

  def new
     @ship = Ship.new
  end

  def create
     @ship = Ship.new(ship_params)
     if @ship.save
     	redirect_to @ship
     else
        render "new"
     end   	
  end	

  def show
  
  end

  def edit
  
  end

  def update
     @ship.update_attributes(ship_params)
     if @ship.errors.empty?
     	redirect_to @ship
     else
        render "edit"
    end
        	
  end
  
  def destroy
     @ship.destroy
     redirect_to ships_path
  end

  private

  def ship_params
     params.require(:ship).permit(:name, :price)
  end

  def current_ship
     @ship = Ship.where(id: params[:id]).first
  end	

end
