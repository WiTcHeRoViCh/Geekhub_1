class WeaponsController < ApplicationController
  before_action :current_weapon, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate

  def index
  	@weapons = Weapon.all
  end

  def show
  end

  def new
  	@weapon = Weapon.new
  end

  def create
    @weapon = Weapon.new(weapon_params)
  end	

  def edit
  end

  def update
    @weapon.update_attributes(weapon_params)
    if @weapon.errors.empty?
    	redirect_to weapon_path(@weapon)
    else
      render :edit
    end  	
  end
  
  def destroy
    @weapon.delete
    redirect_to weapons_path
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :price)
  end

  def current_weapon
    @weapon = Weapon.where(id: params[:id]).first
  end	
end
