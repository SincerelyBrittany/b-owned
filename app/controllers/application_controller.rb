class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :name, :owner]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.permit(:sign_up,
    #     keys: [:username, :email, :password, :password_confirmation])
    # #   devise_parameter_sanitizer.permit(:sign_in,
    # #     keys: [:login, :password, :password_confirmation])
    #   devise_parameter_sanitizer.permit(:sign_in,
    #        keys: [:username, :email, :password, :password_confirmation])
    #   devise_parameter_sanitizer.permit(:account_update,
    #     keys: [:username, :email, :password_confirmation, :current_password])
    # end


  #   def logged_in?
  #     # !!session[:user_id]
  #     !!current_user
  # end 

  # def current_user
  #     User.find_by(id: session[:user_id])
  # end 

  # def log_in(user)
  #     session[:user_id] = user.id
  # end 

  # def authenticate
  #     redirect_to login_path if !logged_in?
  # end 

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
