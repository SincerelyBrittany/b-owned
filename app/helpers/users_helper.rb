module UsersHelper
    def user_main_page
        if current_user == @user && current_user.owner == true #is an owner
            render 'users/owner_show'
        elsif current_user != @user && current_user.owner == false #is not the current user and is not an owner
            render 'users/user_show'
        elsif current_user == @user && current_user.owner == false 
            render 'users/user_show'
        else 
            render 'users/user_show'
        end 
    end 
end
