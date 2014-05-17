class LibrariesController < ApplicationController
  #before_action :load_library, exclude :index

  def index
    @library = Library.all
    @adventure = Adventure.all
  end

  def new
    @library = Library.new
  end

  def create
    #calling on external library, saving url to db
    library = Library.new library_params
    result = Typhoeus.get( library.url + '/adventures.json')
    response = JSON.parse(result.body)

    #using json response to create new adventure in db
    hash = response["adventures"]
    adventure = hash[0]
    Adventure.create!(:title => adventure["title"], :author => adventure["author"], :guid => adventure["guid"])

    #sending back to homepage upon successful creation of new library
    if library.save
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def show

  end

  def load_adventure
    @adventure = Adventure.find(params[:adventure_id])
    redirect_to root_path if @adventure.blank?
  end

private
  def library_params
    params.require(:library).permit(:url)
  end

  # def adventure_params
  #   @title = response["adventures"][0]["title"]
  #   @author = response["adventures"][0]["author"]
  #   @guid = response["adventures"][0]["guid"]
  #end
end

#Adventure.create = response["adventures"][0]["title"]
#Adventure.create!(:title => adventure["title"], :author => adventure["author"], :guid => adventure["guid"])

  # def load_library
  #   @library = @libraries.find(params[:id])
  # end

    #, params: {title: params[:title]}

    # respond_to do |format|
    #   format.html
    #   format.json { render :json => {:libraries => @libraries.as_json} }
    #end


    # @title = response["adventures"][0]["title"]
    # @author = response["adventures"][0]["author"]
    # @guid = response["adventures"][0]["guid"]
