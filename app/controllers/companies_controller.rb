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

    def edit
      # byebug
      @company = Company.find(params[:id])
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
        params.require(:company).permit(:title, :description,:email, :phone, :website, :location)
      end
        def company_params_with_list
          params.require(:company).permit(:list_ids)
        end

end