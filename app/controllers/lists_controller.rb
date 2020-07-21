class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :edit, :update]
  def index
		@lists = List.all
	end

  def show
	end

	def new
		@list = List.new
  end
  
  def create
    @list = List.create(list_params)
       if @list.save
          redirect_to list_path(@list)
      else
          render :new
      end
	end

	def update
	  @list.update(params.require(:list).permit(:name))
	  redirect_to list_path(@list)
	end

	def edit
  end

    def destroy
        @list.destroy
        redirect_to lists_url
      end
    
    private
 
    def list_params
      params.require(:list).permit(:name, :user_id)
    end

    def set_list
      @list = List.find(params[:id])
    end

end
