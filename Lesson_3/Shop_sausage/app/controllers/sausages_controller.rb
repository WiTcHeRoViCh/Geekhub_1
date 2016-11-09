class SausagesController < ApplicationController
  before_action :current_sausages, only: [:show, :edit, :upadate, :destroy]

  def index
  	@sausages = Sausage.all
  end

  def show
  end

  def new
  	@sausage = Sausage.new
  end

  def create
    @sausage = Sausage.new(sausage_params)
    if @sausage.save
    	redirect_to sausage_path(@sausage)
    else
      render :new
    end  	
  end	

  def edit
  end

  def update
    @sausage.update_attributes(sausage_params)
    if @sausage.errors.empty?
    	redirect_to @sausage
    else
      render :edit
    end  	
  end

  def destroy
    @sausage.delete
    redirect_to sausages_path
  end
  
  private

  def current_sausages
    @sausage = Sausage.where(id: params[:id]).first
  end	

  def sausage_params
    params.require(:sausage).permit(:name, :price)
  end	
  	
end
