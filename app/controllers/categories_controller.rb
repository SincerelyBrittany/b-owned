class CategoriesController < ApplicationController
    before_action :authenticate_user, except: [:index]
    def index
        if params[:category_id] && !params[:category_id].empty?
            @category = Category.find(params[:category_id])
            #@category.companies
            @companies = @category.companies
            render 'index'
        else 
        @categories = Category.all
        end 
    end 
    def show
        @category = Category.find(params[:id])
    end 
end
