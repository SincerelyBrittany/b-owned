class CompaniesController < ApplicationController
 # before_action :set_company, only: [:show]
    # def index
    #   @companies = Company.all
    # end

    # def index
    #   byebug
    #   if params[:search]
    #     @companies = Company.search(params[:search])
    #   else
    #     @companies = Company.all
    #   end
    # end

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
      #@company.lists.build(name: "First Ingredient")
      #@companylist = CompanyList.new
      @lists = List.all
    end
  
    def new
      @company = Company.new
    end
  
      def create
      
          #@company = company.create({name: params[:company][:name], user_id: 1}) #must set up current user and company params properly
          @company = Company.create(company_params)
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
        params.require(:company).permit(:title, :description)
      end
        def company_params_with_list
          params.require(:company).permit(:list_ids)
        end

end
