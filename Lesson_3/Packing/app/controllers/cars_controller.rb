class CarsController < ApplicationController
  before_action :find_by_id, only: [:show, :edit, :update, :destroy]

  def index
     @cars = Car.all
  end

  def new
     @car = Car.new
  end

  def create
     @car = Car.create(car_params)
     if @car.errors.empty?
     	redirect_to @car
     	flash[:notice]="Нou have successfully registered"
     else
        render "new"
     end   	
  end	

  def show
  
  end

  def edit
  
  end

  def update
     @car.update_attributes(car_params)
     if @car.errors.empty?
     	redirect_to @car
     else
        render "edit"
    end
        	
  end
  
  def destroy
     @car.destroy
     redirect_to cars_path
  end

  private

  def car_params
     params.require(:car).permit(:name, :weight)
  end

  def find_by_id
     @car = Car.where(id: params[:id]).first
  end	

end
