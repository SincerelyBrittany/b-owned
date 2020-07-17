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

	# def update
	#   byebug
	# end

	# def edit
	#   byebug
    # end

    # def destroy
    #     byebug
    #   end

    private

    def strong_params
        params.require(:company_list).permit(:list_id, :company_id)
    end
    
end
