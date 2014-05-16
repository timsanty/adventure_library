class AdventuresController < ApplicationController


	def index
		@adventures = Adventure.all
		respond_to do |format|
			format.html
			format.json { render :json => {:adventures => @adventures.as_json(except: [:id, :library_id], include: {:pages => {except: [:id, :adventure_id, :created_at, :updated_at]} })} }	end
		end
	end

	def new
		@adventure = Adventure.new
	end

	def create
		adventure = Adventure.new adventure_params
		adventure.GUID = SecureRandom.urlsafe_base64(10)
		adventure.save
		redirect_to adventure
	end

	def edit
		@adventures = Adventure.find(params[:id])
	end

	def update
	end

	def show
		@adventure = Adventure.find(params[:id])
	end



	private
	  	def adventure_params
	    	params.require(:adventure).permit(:title, :author)
	  	end

