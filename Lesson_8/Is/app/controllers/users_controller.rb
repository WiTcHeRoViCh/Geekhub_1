class UsersController < ApplicationController
	before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @comments = @user.comments
    @comment = Comment.new
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

  def edit
    
  end

  def update
    @user.update(user_params)
    if @user.update
    	redirect_to @user
    else
      render :edit
    end
      	
  end

  def destroy
    @user.delete
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :second_name, :age)
  end 

  def current_user
    @user = User.find(params[:id])
  end	

end
