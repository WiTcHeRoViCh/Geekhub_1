class PlanesController < ApplicationController
  before_filter :find_by_id, only: [:show, :edit, :update, :destroy]

  def index
     @planes = Plane.all
  end

  def new
     @plane = Plane.new
  end

  def create
     @plane = Plane.new(planes_params)
     if @plane.save
     	redirect_to @plane
     	flash[:notice] = 'New plane create'
     else
        render "new"
     end   	
  end	

  def show
  end

  def edit
  end

  def update
     @plane.update_attributes(planes_params)
     if @plane.errors.empty?
     	redirect_to @plane
     else
        render "edit"
     end   	
  end
  
  def destroy
     @plane.destroy
     redirect_to planes_path
  end

  private

  def find_by_id
     @plane = Plane.where(id: params[:id]).first
  end

  def planes_params
     params.require(:plane).permit(:name, :price)
  end	
end
