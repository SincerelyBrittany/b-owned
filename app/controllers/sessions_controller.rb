class SessionsController < ApplicationController

    def new 

    end 

    def create 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            # session[:user_id]
            log_in(@user)
            flash[:sucess] = "Welcome, #{@user.username}"
            redirect_to lists_path
        else 
            flash[:danger] = "Improper credentials given"
            redirect_to login_path
        end 
    end 

    def destroy 
        session.clear 
        redirect_to login_path
    end 
end
