class Admin::UsersController < AdminController
  before_action :current_u, only: [:show, :edit, :update, :destroy]

  def index
    
  end	

  def show
  end
  
  def edit
  end
  
  def destroy
    @user.destroy
    redirect_to all_users_path
  end

  private

  def admin_users
    params.require(:users_all).permit(:admin)
  end	

  def current_u
    @user = users_all.find(params[:id])
  end	

end	