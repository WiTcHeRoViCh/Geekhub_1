class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :require_user

  private

  def authenticated_only
    redirect_to login_path unless current_user
  end

  def unauthenticated_only
    redirect_to tasks_path if current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end	

  def require_user
    #redirect_to root_path unless current_user
  end

  helper_method :current_user
end
