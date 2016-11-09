class PhonesController < ApplicationController
  before_action :current_phone, only: [:show, :edit, :update, :destroy]

  def index
  	@phones = Phone.all
  end

  def show
  end

  def new
  	@phone = Phone.new
  end

  def create
    @phone = Phone.new(phone_params)
    if @phone.save
    	redirect_to phone_path(@phone)
    else
      render :new
    end  	
  end	

  def edit
  end

  def update
    @phone.update_attributes(phone_params)
    if @phone.errors.empty?
    	redirect_to @phone
    else
      render :edit
    end  	
  end	

  def destroy
    @phone.delete
    redirect_to phones_path
  end	

  private

  def phone_params
    params.require(:phone).permit(:name, :price)
  end	

  def current_phone
    @phone = Phone.where(id: params[:id]).first
  end	
end
