class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:destroy, :edit, :update]

  def index
    authorize_admin
    @lists = List.all
	end

  def show
    #everyone can see
    @list = List.find(params[:id])
	end

	def new
		@list = List.new
  end
  
  def create
    @list = List.create(list_params)
    @list.user = current_user
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
      params.require(:list).permit(:name)
    end

    def set_list
      @list = List.find(params[:id])
      authorize(@list)
    end



end
