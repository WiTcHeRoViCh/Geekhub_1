class UsersController < ApplicationController
  before_action :current_resources, only: [:show, :update, :destroy]
  before_action :admin, only: :update

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
    #binding.pry
    @user.update_attributes(admin)
    if @user.save
      redirect_to all_users_path
    else
      redirect_to edit_admin_user_path(@user)
    end 
  end 

  def destroy
    @user.destroy
    redirect_to all_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end	

  def admin
    params.require(:user).permit(:admin)
  end  

  def current_resources
    @user = User.find(params[:id])
  end 

end
