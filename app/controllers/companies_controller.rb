class CompaniesController < ApplicationController
 # before_action :set_company, only: [:show]
    def index
      @companies = Company.all
    end
  
    def show
      @company = Company.find(params[:id])
      #@company.lists.build(name: "First Ingredient")
      #@companylist = CompanyList.new
      @lists = List.all
    end
  
    def new
      @company = Company.new
    end
  
      def create
          byebug
          #@company = company.create({name: params[:company][:name], user_id: 1}) #must set up current user and company params properly
          @company = company.create(company_params)
          if @company.save
        redirect_to company_path(@company)
      else
        render :new
      end
    end
  
    def update
      @company = Company.find(params[:id])
      @list = params[:company][:list_ids]
      @company.update(company_params)
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
      
        def company_params
          params.require(:company).permit(:list_ids)
        end

end
