class PositionsController < ApplicationController

  def new
    @p = Position.new
  end
  
  def create
    @p = Position.create(position_params)
    redirect_to user_carts_path(current_user)
  end	

  private

  def position_params
    params.require(:position).permit(:item_id, :cart_id, :quantity)
  end	

end	