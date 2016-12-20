class UsersController < ApplicationController
  
  def index
  	session[:user_id] = nil
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    find_user
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end    
  end	

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end	


end
