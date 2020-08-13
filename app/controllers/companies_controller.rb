class CompaniesController < ApplicationController
  before_action :authenticate_user, except: [:index]
 # before_action :set_company, only: [:show]

 def home 
  
 end 
    def index
      if params[:query]
        @companies = Company.search(params[:query])
        render 'index'
      # elsif params[:category_id] && !params[:category_id].empty?
      #       @category = params[:category_id]
      #       @companies = Company.where(category_id: @category)
      #       render 'index'
        #Company.where(category_id: @category)
        #Category.joins(:companies).where(category_id: { category_id })
        # SELECT categories.* FROM categories
        # INNER JOIN articles ON articles.category_id = categories.id
       # @companies = Company.joins(:category.where(category: {role: User.roles[:doctor]}, name: params[:name][:name].downcase)
      else
        @companies = Company.all
        @categories = Category.all
      end
    end
  
    def show
      @company = Company.find(params[:id])
      @lists = List.all
    end
  
    def new
      if current_user.owner? || current_user.admin?
         @company = Company.new
         #@company = Post.new(category_id: params[:category_id])
         @categories = Category.all 
      else 
        redirect_to companies_path
      end 
    end
  
      def create
        # byebug
          @company = Company.create(company_params)
          @company.user = current_user
          if @company.save
        redirect_to company_path(@company)
      else
        render :new
      end
    end

    def edit
      @company = Company.find(params[:id])
      @categories = Category.all 
    end
  
    def update 
      if params[:artist_id]
        @company = Company.find(params[:id])
        @list = params[:company][:list_ids]
        @company.update(company_params_with_list)
        redirect_to list_path(@list)
      else 
        unless current_user.admin? || current_user.owner?
          redirect_to companies_path
        else 
          @company = Company.find(params[:id])
            if @company.user == current_user
              @company.update(company_params)
              redirect_to company_path(@company)
            else 
              redirect_to companies_path
            end 
        end  
      end
    end
  
      def destroy
        unless current_user.admin? || current_user.owner?
          redirect_to companies_path
        else 
          @company = Company.find(params[:id])
            if @company.user == current_user 
                @company.destroy
                redirect_to @company.user
            else 
              redirect_to companies_path
            end 
        end
      end 
        
  private  
      def company_params
        params.require(:company).permit(:title, :description, :email, :phone, :website, :location, :category_id)
      end
        def company_params_with_list
          params.require(:company).permit(:list_ids)
        end

end