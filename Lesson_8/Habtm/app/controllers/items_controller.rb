# frozen_string_literal: true
class ItemsController < ApplicationController
  before_action :current_user_resource
  before_action :current_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @user.items
  end

  def show; end

  def new
    @item = Item.new
  end

  def create
    @item = @user.items.build(item_params)
    if @item.save
      redirect_to [@user, @item]
    else
      render :new
    end
  end

  def edit; end

  def update
    @item.update(item_params)
    if @item.update
      redirect_to [@user, @item]
    else
      render :edit
    end
  end

  def destroy
    @item.delete
    redirect_to user_items_path(@user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :user_id)
  end

  def current_item
    @item = @user.items.find(params[:id])
  end

  def current_user_resource
    @user = User.find(params[:user_id])
  end
end
