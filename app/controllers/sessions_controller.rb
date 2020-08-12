class SessionsController < ApplicationController

    def new 

    end 
    def create
        if auth_hash = request.env["omniauth.auth"] 
            user = User.find_or_create_by_omniauth(auth_hash)
                session[:user_id] = user.id
                redirect_to companies_path 
        else
          if @user = User.find_by(username: params[:username]) || User.find_by(email: params[:username])
                if @user && @user.authenticate(params[:password])
                # session[:user_id]
                log_in(@user)
                flash[:sucess] = "Welcome, #{@user.username}"
                redirect_to companies_path     
            else
                flash[:danger] = "Improper login information entered."
                redirect_to login_path
            end
        else
            flash[:danger] = "Improper login information entered."
            redirect_to login_path
        end
      end 
    end

    def destroy 
        session.clear 
        redirect_to login_path
    end 
end
