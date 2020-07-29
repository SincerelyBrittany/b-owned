class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :set_comment, only: [:update, :edit, :destroy]
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
     redirect_to @comment.company
    else 
      redirect_to @comment.company, alert: "Comment not saved"
    end 
  end

  def update
    if @comment.user == current_user
      @comment.update(params.require(:comment).permit(:content))
      redirect_to  @comment.company
    else 
      flash[:danger] = "You are not the comment owner"
      redirect_to @comment.company
    end 
	end

  def edit
    redirect_to @comment.company if @comment.user != current_user
  end

  def destroy
    if @comment.user == current_user
         @comment.destroy
         redirect_to @comment.company
    else 
      flash[:danger] = "You are not the comment owner"
      redirect_to @comment.company
    end 
  end 


  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end 

  def comment_params
    params.require(:comment).permit(:content, :company_id, user_attributes:[:username], company_attributes:[:company_id])
   #params.require(:comment).permit(:content, :company_id, :user_id)
  end
end
