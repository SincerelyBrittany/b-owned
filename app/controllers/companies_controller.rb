class CompaniesController < ApplicationController
  before_action :authenticate_user, except: [:index]
 # before_action :set_company, only: [:show]
    def index
      if params[:query]
        @companies = Company.search(params[:query])
        render 'index'
      else
        @companies = Company.all
      end
    end
  
    def show
      @company = Company.find(params[:id])
      @lists = List.all
    end
  
    def new
    
      if current_user.owner? || current_user.admin?
         @company = Company.new
      
      else 
        redirect_to companies_path
      end 
    end
  
      def create
          @company = Company.create(company_params)
          @company.user = current_user
          if @company.save
        redirect_to company_path(@company)
      else
        render :new
      end
    end
  
    def update
      @company = Company.find(params[:id])
      @list = params[:company][:list_ids]
      @company.update(company_params_with_list)
      redirect_to list_path(@list)
    end
  
    def edit
      @company = company.find(params[:id])
      end
  
      def destroy
          @company = company.find(params[:id])
          @company.destroy
          redirect_to companys_url
        end
        
  private  
      def company_params
        params.require(:company).permit(:title, :description,:email, :phone, :website, :location)
      end
        def company_params_with_list
          params.require(:company).permit(:list_ids)
        end

end