class LibrariesController < ApplicationController
  #before_action :load_library, exclude :index

  def index
    @library = Library.all
    # respond_to do |format|
    #   format.html
    #   format.json { render :json => {:libraries => @libraries.as_json} }
    #end
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(params[:url])
    response = Typhoeus.get( @library.url + '.json')
    binding.pry
    @library.save
  end

  def show

  end

  def load_adventure
    @adventure = Adventure.find(params[:adventure_id])
    redirect_to root_path if @adventure.blank?
  end


  # def load_library
  #   @library = @libraries.find(params[:id])
  # end

    # response = Typhoeus.get( @library.url + '.json')
    # JSON.parse(response.body)
    # redirect_to root_path

end
