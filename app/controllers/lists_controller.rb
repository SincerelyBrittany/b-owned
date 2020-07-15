class ListsController < ApplicationController
    
    def index
		@lists = List.all
	end

    def show
        # byebug
		@list = List.find(params[:id])
	end

	def new
		@list = List.new
	end

    def create
        # @list = List.create({
        # user_id: params[:list][:user],
        # name: params[:list][:name]
        # })
        @list = List.create({name: params[:list][:name], user_id: 1})
	#   @list = List.new(params.require(:list).permit(:title))
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
    #   byebug
      params.require(:list).permit(:name)
    end

end
