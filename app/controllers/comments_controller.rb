class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    byebug
    @comment.user = current_user
    redirect_to @comment.company
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :company_id, :user_id, user_attributes:[:username])
   #params.require(:comment).permit(:content, :company_id, :user_id)
  
  end
end
