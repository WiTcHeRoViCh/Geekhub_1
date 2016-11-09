class PostsController < ApplicationController

    def index
       @posts = Post.all
    end	

    def new
       @post = Post.new
    end	

    def create
       #post = Post.find(id: params[:id])
       post = Post.create(params.require(:post).permit(:name, :words))
   	     redirect_to post
    end	

    def show
       @post = Post.where(id: params[:id]).first
    end	

    def edit
       @post = Post.find(params[:id])
    end	

    def update
       @post = Post.find(params[:id])
       @post.update_attributes(params.require(:post).permit(:name, :words))
       redirect_to @post
    end	

    def destroy
       @post = Post.find(params[:id])
       @post.destroy
       redirect_to action: "index"
    end	

end
