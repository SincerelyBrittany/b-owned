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
        # puts session[:user_id]
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
    
    def authenticate
      redirect_to login_path if !logged_in?
    end
    
    def authorize_user(u)
      redirect_to user_path(u.id) if u != current_user
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
    
    def authorize_admin
      authenticate
      redirect_to companies_path if current_user.admin == false
    end

    def authorize_owner(company)
      authenticate
      redirect_to companies_path if company.user == false || company.admin == false
    end

    
    def authorize(list)
      authenticate
      redirect_to list_path(list.id) if list.user != current_user && current_user.admin != true
    end
end
