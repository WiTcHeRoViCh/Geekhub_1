class ItemsController < ApplicationController

    def index
       @items = Item.all
    end

    def new 
       @item = Item.new
    end	

    def create
       item = Item.create(params.require(:item).permit(:name, :weight, :description))
       if item.errors.empty?
          redirect_to item
       else
          render "new"
       end       
    end	

    def show
       @item = Item.find(params[:id])
    end

    def edit
       @item = Item.find(params[:id])
    end	

    def update
       @item = Item.find(params[:id])
       @item.update_attributes(params.require(:item).permit(:name, :weight, :description))
       if @item.errors.empty?
       	  redirect_to @item
       else
          render "edit"
       end   	  
    end	

    def destroy
       @item = Item.find(params[:id])
       @item.destroy
       redirect_to action: "index" 
    end	

end
