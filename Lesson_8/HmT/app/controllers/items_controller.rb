class ItemsController < ApplicationController
  before_action :current_item, only: [:show, :edit, :update, :destroy]

  def index
  	session[:item_id] = nil
  	@items = Item.all
  end

  def show
  	find_item
  end

  def new
  	@item = Item.new
  end

  def create
    @item = Item.new(item_params)
  	if @item.save
  		redirect_to [@user, @item]
  	else
  	  render :new
  	end
  end	

  def edit
  	  	
  end

  def update
    @item.update(item_params)
    if @item.update
    	redirect_to @item
    else
      render :edit
    end  	
  end
  
  def destroy
    @item.destroy
    redirect_to items_path
  end

  private 

  def item_params
    params.require(:item).permit(:name, :price)
  end	

  def current_item
    @item = Item.find(params[:id])
  end	

end
