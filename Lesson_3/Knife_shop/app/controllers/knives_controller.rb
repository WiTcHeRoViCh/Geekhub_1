class KnivesController < ApplicationController
  before_action :current_knife, only: [:show, :edit, :update, :destroy]

  def index
  	@knives = Knife.all
  end

  def show
  end

  def new
  	@knife = Knife.new
  end

  def create 
    @knife = Knife.new(knife_params)
    if @knife.save
    	redirect_to @knife
    else
      render :new
    end  	
  end	

  def edit
  end

  def update
    @knife.update_attributes(knife_params)
    if @knife.errors.empty?
    	redirect_to @knife
    else
      render :edit
    end  	
  end	

  def destroy
    @knife.delete
    redirect_to knives_path
  end	

  private

  def knife_params
    params.require(:knife).permit(:name, :price)
  end	

  def current_knife
    @knife = Knife.where(id: params[:id]).first
  end	
end