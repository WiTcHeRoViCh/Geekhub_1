class CartsController < ApplicationController

  def index
    @carts = current_user.cart.items
  end	

end	