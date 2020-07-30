class FavoritesController < ApplicationController
    before_action :authenticate_user
    def create
        @favorite = current_user.favorites.build(company_id: params[:company_id])
        if @favorite.save
            redirect_to @favorite.company
        else 
            @fav = Favorite.find_by(user_id: @favorite.user_id, company_id: @favorite.company_id)
            @fav.destroy
            redirect_to @favorite.company
        end
    end
    
    def index
        @company = Company.find(params[:company_id])
    end 

    def fav_params
        params.require(:favorite).permit(:company_id)
    end
end
