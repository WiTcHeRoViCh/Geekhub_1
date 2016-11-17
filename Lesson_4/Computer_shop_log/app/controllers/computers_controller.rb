class ComputersController < ApplicationController
  before_action :current_computer, only: [:show, :edit, :update, :destroy]

  def index
  	@computers = Computer.all
  end

  def show
  end

  def new
  	@computer = Computer.new
  end

  def create
    @computer = Computer.new(computer_params)
    if @computer.save
    	redirect_to @computer
    else	
    	render :new
    end	
  end	

  def edit
  end

  def update
    @computer.update_attributes(computer_params)
    if @computer.errors.empty?
    	redirect_to @computer
    else
      render :edit
    end  	
  end	

  def destroy
    @computer.delete
    redirect_to computers_path
  end	

  private

  def computer_params
    params.require(:computer).permit(:name, :price)
  end	

  def current_computer
    @computer = Computer.where(id: params[:id]).first
  end	
end