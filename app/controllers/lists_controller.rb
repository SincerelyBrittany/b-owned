class ListsController < ApplicationController
    def index
		@lists = List.all
	end

    def show
		@list = List.find(params[:id])
	end

	def new
		@list = List.new
	end

    def create
        # byebug
        #@list = List.create({name: params[:list][:name], user_id: 1}) #must set up current user and list params properly
        @list = List.create(list_params)
        if @list.save
           redirect_to list_path(@list)
        else
          render :new
      end
	end

	def update
	  @list = List.find(params[:id])
	  @list.update(params.require(:list).permit(:name))
	  redirect_to list_path(@list)
	end

	def edit
	  @list = List.find(params[:id])
    end

    def destroy
        @list = List.find(params[:id])
        @list.destroy
        redirect_to lists_url
      end
    
    private
 
    def list_params
      #params.require(:list).permit(:name, user_ids: [])
      params.require(:list).permit(:name, :user_id)
    end

end
