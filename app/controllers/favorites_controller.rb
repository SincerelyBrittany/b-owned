class FavoritesController < ApplicationController
    def create
        @favorite = Favorite.new(fav_params)
        # if Favorite.where(user_id: @favorite.user_id, company_id: @favorite.company_id)
            #see if liked is true 
            #if liked is true then redirect to company page with message saying you already follow/favorited
        #else 
         #if liked is false then save favorite and redirect to user page showing follow.    
        if @favorite.save
            redirect_to @favorite.user
        else
            redirect_to @favorite.company
        end
    end
    
    def index
        # byebug
        @company = Company.find(params[:company_id])
        #raise params.inspect
    end 

    def fav_params
        params.require(:favorite).permit(:user_id, :company_id, :liked)
    end
end
