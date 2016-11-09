class PicturesController < ApplicationController
  before_action :current_picture, only: [:show, :edit, :update, :destroy]

  def index
  	@pictures = Picture.all
  end

  def show
  end

  def new
  	@picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
    	redirect_to @picture
    else	
    	render :new
    end	
  end	

  def edit
  end

  def update
    @picture.update_attributes(picture_params)
    if @picture.errors.empty?
    	redirect_to @picture
    else
      render :edit
    end  	
  end	

  def destroy
    @picture.delete
    redirect_to pictures_path
  end	

  private

  def picture_params
    params.require(:picture).permit(:name, :price)
  end	

  def current_picture
    @picture = Picture.where(id: params[:id]).first
  end	
end
