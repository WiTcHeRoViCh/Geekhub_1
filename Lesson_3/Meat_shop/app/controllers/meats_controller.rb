class MeatsController < ApplicationController
  before_action :current_meat, only: [:show, :edit, :update, :destroy] 

  def index
  	@meats = Meat.all
  end

  def show
  end

  def new
  	@meat = Meat.new
  end

  def create
    @meat = Meat.new(meat_params)
    if @meat.save
    	redirect_to meat_path(@meat)
    else
      render :new
    end  	
  end	

  def edit
  end

  def update
    @meat.update_attributes(meat_params)
    if @meat.errors.empty?
    	redirect_to meat_path(@meat)
    else
      render :edit
    end  	
  end	

  def destroy
    @meat.delete
    redirect_to meats_path
  end	

  private

  def meat_params
    params.require(:meat).permit(:name, :price)
  end	

  def current_meat
    @meat = Meat.where(id: params[:id]).first
  end	
end
