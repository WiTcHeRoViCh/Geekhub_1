class UsersController < ApplicationController
  before_action :current_resources, only: [:show, :update, :destroy]

  def show

  end 

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
    	session[:user_id] = user.id
    	redirect_to user_path(user)
    else
      render :new
    end  	
  end

  def update
    @user.update_attributes(user_params)
    if @user.errors.empty?
      redirect_to all_users_path
    else
      render :edit
    end 
  end 

  def destroy
    @user.destroy
    redirect_to all_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end	

  def current_resources
    @user = User.find(params[:id])
  end 

end
