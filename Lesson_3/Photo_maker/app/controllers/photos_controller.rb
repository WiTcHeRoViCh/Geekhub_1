class PhotosController < ApplicationController
  before_action :current_photo, only: [:show, :edit, :update, :destroy]

  def index
  	@photos = Photo.all
  end

  def show
  end

  def new
  	@photo = Photo.new
  end

  def create 
    @photo = Photo.new(photo_params)
    if @photo.save
    	redirect_to @photo
    else
      render :new
    end  	
  end	

  def edit
  end

  def update
    @photo.update_attributes(photo_params)
    if @photo.errors.empty?
    	redirect_to @photo
    else
      render :edit
    end  	
  end	

  def destroy
    @photo.delete
    redirect_to photos_path
  end	

  private

  def photo_params
    params.require(:photo).permit(:name, :price)
  end	

  def current_photo
    @photo = Photo.where(id: params[:id]).first
  end	
end