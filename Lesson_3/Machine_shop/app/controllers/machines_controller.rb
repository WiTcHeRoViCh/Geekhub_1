class MachinesController < ApplicationController
  before_action :current_machine, only: [:show, :edit, :update, :destroy]

  def index
  	@machines = Machine.all
  end

  def show
  end

  def new
  	@machine = Machine.new
  end

  def create 
    @machine = Machine.new(machine_params)
    if @machine.save
    	redirect_to @machine
    else
      render :new
    end  	
  end	

  def edit
  end

  def update
    @machine.update_attributes(machine_params)
    if @machine.errors.empty?
    	redirect_to @machine
    else
      render :edit
    end  	
  end	

  def destroy
    @machine.delete
    redirect_to machines_path
  end	

  private

  def machine_params
    params.require(:machine).permit(:name, :price)
  end	

  def current_machine
    @machine = Machine.where(id: params[:id]).first
  end	
end
