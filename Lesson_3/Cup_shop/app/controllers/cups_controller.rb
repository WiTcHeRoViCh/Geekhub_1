class CupsController < ApplicationController
  before_action :current_cup, only: [:show, :edit, :update, :destroy]

  def index
  	@cups = Cup.all
  end

  def show
  end

  def new
  	@cup = Cup.new
  end

  def create
    @cup = Cup.new(cup_params)
    if @cup.save
    	redirect_to @cup
    else	
    	render :new
    end	
  end	

  def edit
  end

  def update
    @cup.update_attributes(cup_params)
    if @cup.errors.empty?
    	redirect_to @cup
    else
      render :edit
    end  	
  end	

  def destroy
    @cup.delete
    redirect_to cups_path
  end	

  private

  def cup_params
    params.require(:cup).permit(:name, :price)
  end	

  def current_cup
    @cup = Cup.where(id: params[:id]).first
  end	
end
