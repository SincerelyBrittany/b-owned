class FavoritesController < ApplicationController
    def create
        @favorite = Favorite.new(fav_params)

        if @favorite.save
            redirect_to @favorite.user
        else 
            @fav = Favorite.find_by(user_id: @favorite.user_id, company_id: @favorite.company_id)
            @fav.destroy
            redirect_to @favorite.company
        end
    end

    def new
        @favorite = Favorite.new
    end 
    
    def index
        # byebug
        @company = Company.find(params[:company_id])
        #raise params.inspect
    end 

    def fav_params
        params.require(:favorite).permit(:user_id, :company_id)
    end
end
