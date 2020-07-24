class FavoritesController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    def create
        @favorite = Favorite.new(fav_params)
        @favorite.user = current_user
        # byebug
        if @favorite.save
            #redirect_to @favorite.user
            redirect_to @favorite.company
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
        #params.require(:favorite).permit(:user_id, :company_id)
        params.require(:favorite).permit(:company_id)
    end
end
