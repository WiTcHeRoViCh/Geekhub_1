class CupsController < ApplicationController
  before_action :current_user_resource
  before_action :current_cup, only: [:show, :edit, :update, :destroy]

  def index
  	@cups = @user.cups.paginate(page: params[:page])
  end

  def show
  end

  def new
  	@cup = Cup.new
  end

  def create
    @cup = @user.cups.build(cup_params)
    if @cup.save
    	redirect_to [@user, @cup]
    else	
    	render :new
    end	
  end	

  def edit
  end

  def update
    @cup.update_attributes(cup_params)
    if @cup.errors.empty?
    	redirect_to [@user, @cup]
    else
      render :edit
    end  	
  end	

  def destroy
    @cup.delete
    redirect_to user_cups_path
  end	

  private

  def cup_params
    params.require(:cup).permit(:name, :price)
  end	

  def current_cup
    @cup = @user.cups.where(id: params[:id]).first
  end	

  def current_user_resource
    @user = User.find(params[:user_id])
  end 
end
