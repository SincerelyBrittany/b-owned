module Accessible
    extend ActiveSupport::Concern
    included do
      before_action :check_user
    end
  
    protected
    def check_user
      if current_user && current_user.admin == true
        flash.clear
        # if you have rails_admin. You can redirect anywhere really
        redirect_to(rails_admin) and return
      elsif current_user && current_user.admin == false
        flash.clear
        # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
        redirect_to(authenticated_user_root_path) and return
      elsif current_owner
        flash.clear
        # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
        redirect_to(authenticated_owner_root_path) and return
      end
    end
  end