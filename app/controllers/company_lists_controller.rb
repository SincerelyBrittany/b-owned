class CompanyListsController < ApplicationController
    # def index
    #     byebug
		
	# end

    # def show
    #     byebug
		
	# end

    # def new
    #     byebug
        
	# end

    def create
       @companylist = CompanyList.create(strong_params)
       redirect_to @companylist.list
	end

    def destroy
        @currentlist = List.find(params[:current_list])
        authorize_company_list?(@current_list)
        @company = CompanyList.find_by(company_id: params[:company_id], list_id: params[:current_list])
        # byebug
        @company.destroy
        redirect_to list_path(@currentlist)
      end

    private

    def strong_params
        params.require(:company_list).permit(:list_id, :company_id)
    end

    def authorize_company_list(company)
        authenticate
        redirect_to company_list_path(@currentlist.id) if @currentlist.user != current_user && current_user.admin != true
    end 

    
end
