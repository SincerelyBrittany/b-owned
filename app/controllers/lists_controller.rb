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
        List.create({
        user_name: params[:list][:user_name],
        name: params[:list][:name]
        })
	#   @list = List.new(params.require(:list).permit(:title))
    # if @list.save
      redirect_to list_path(@list)
    # else
    #   render :new
    # end
	end

	def update
	  @list = List.find(params[:id])
	  @list.update(params.require(:list).permit(:title, :description, :user_id))
	  redirect_to list_path(@list)
	end

	def edit
	  @list = List.find(params[:id])
    end
    
    private
 
    def list_params
      #params.require(:list).permit(:name, user_ids: [])
      params.require(:list).permit(:user_name, :name)
    end

end
