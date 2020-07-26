class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user

    def log_in(user)
        session[:user_id] = user.id
    end 

    def authenticate_user
        redirect_to login_path if !logged_in?
    end 

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
    
    def authenticate
      redirect '/login' if !logged_in?
    end
    
    def authorize_user(user)
      authenticate
      redirect_to companies_path if user != current_user
    end
    
    def authorize_admin
      authenticate
      redirect_to companies_path if current_user.admin == false
    end
    
      # def authorize_user(user)
      #   if user != current_user 
      #     redirect '/companies' 
      #   elsif user != current_user && current_user.owner == false
      # end 
    
    def authorize(list)
        authenticate
        redirect_to list_path(list.id) if list.user != current_user && current_user.admin != true
    end
end
