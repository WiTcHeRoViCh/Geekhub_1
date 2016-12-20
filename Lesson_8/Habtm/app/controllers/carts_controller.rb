# frozen_string_literal: true
class CartsController < ApplicationController
  before_action :current_user

  def index
    @cart = @user.cart.items
  end

  def new
    @cart = @user.cart.items.push(cart_params)
    redirect_to user_carts_path(@user)
  end

  def destroy
    @cart.delete
    redirect_to @cart
  end

  private

  def current_user
    @user = User.find(params[:user_id])
  end

  def cart_params
    @item = Item.last
  end
end
