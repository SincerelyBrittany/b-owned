class FavoritesController < ApplicationController
    def create
       
        @favorite = Favorite.create(fav_params)
        if @favorite.save
            @favorite.user
        else
            @favorite.company
        end
	end

    def fav_params
        params.require(:favorite).permit(:user_id, :company_id)
    end
end
