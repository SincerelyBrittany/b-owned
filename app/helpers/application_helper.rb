module ApplicationHelper
    def navbar
        if logged_in?
            render "layouts/logged_in_navbar"
        else
            render "layouts/logged_out_navbar"
        end 
    end 
    def current_user_logged_in
        if current_user && current_user.admin == false && current_user.owner == true
            render 'layouts/owner_logged_in_navbar'
        elsif current_user && current_user.admin == true && current_user.owner == false
             render 'layouts/admin_logged_in_navbar'
        elsif current_user && current_user.owner == false && current_user.admin == false
            render 'layouts/logged_in_navbar'
        else 
              render 'layouts/logged_out_navbar' 
         end 
    end
end
