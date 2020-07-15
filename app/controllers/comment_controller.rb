class CommentController < ApplicationController
    def new
        @company = Company.find(params[:company_id])
        @comment = Comment.new
    end

    def create
        @company = Company.find params[:company_id]
        @comment = @company.comments.build_with_user(comment_params, current_user)
        if @comment.save
            redirect_to companies_path
        else
            if @comment.errors[:user]
                # Note: if you have correctly disabled the comment button where appropriate,
                # this should never happen...
                redirect_to companies_path, alert: 'You have already commented this company'
            else
                # Why would we render new again?  What else could cause an error?
                render :new
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
