class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :set_user, only: [:destroy, :edit, :update]
    def index
        authorize_admin
        @users = User.all
      end
    
      def show
        @user = User.find(params[:id])
      end
    
      def new
        @user = User.new
      end
    
      def edit
      
      end
    
      def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id #logs in the user -- tells app that user is logged in
            redirect_to @user
        else
          render :new
        end
      end
    
      def update
        if @user.update(user_params)
          redirect_to @user
        else
          render :edit
        end
      end
    
      def destroy
        @user.destroy
        redirect_to users_url
      end

  private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
      authorize_user(@user)
    end

end
