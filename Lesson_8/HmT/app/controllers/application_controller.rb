class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def find_user
    user = User.find_by(id: params[:id])
    if user 
      session[:user_id] = user.id	
    end  
  end	

   def find_item
    item = Item.find_by(id: params[:id])
    if item 
      session[:item_id] = item.id	
    end  
  end

  def current_item
    @current_item = Item.find(session[:item_id]) if session[:item_id]
  end	

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end	

  helper_method :current_user, :current_item
end
