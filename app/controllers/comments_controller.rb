class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
     redirect_to @comment.company #redirect to all comments
    else 
      redirect_to @comment.company
    end 
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :company_id, user_attributes:[:username])
   #params.require(:comment).permit(:content, :company_id, :user_id)
  end
end
