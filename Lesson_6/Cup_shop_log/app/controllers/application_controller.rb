class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  private

  def check_user
    redirect_to user_cups_path(current_user) if current_user
  end		

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def users_all
    @users_all = User.all
  end	

  def all_cups
  	  #User.all{|u| return @all_cups[u.id] = u.cups.find(u.id) }
  end	

  helper_method :current_user, :users_all, :all_cups
end
