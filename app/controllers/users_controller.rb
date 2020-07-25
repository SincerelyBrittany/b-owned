class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    # def edit
    #     byebug
    #     @user = User.find_by(id: params[:id])
    #     authorize_user(@user)
    # end 

    # def update
    #     byebug
    #     @user = User.find(params[:id])
    #     if @user.update(user_params)
    #       redirect_to @user
    #     else
    #       render :edit
    #     end
    #   end
    
      def destroy
        byebug
        # @user = User.find(params[:id])
        # @user.destroy
        # redirect_to users_url
      end
end
