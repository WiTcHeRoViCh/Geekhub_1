class CommentsController < ApplicationController

  def create
  	#binding.pry
    Comment.create(comment_params)
    redirect_back fallback_location: root_path
  end	

  def destroy
    Comment.find(params[:id]).delete
    redirect_back fallback_location: root_path
  end	

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :commentable_type, :commentable_id)
  end 

end	