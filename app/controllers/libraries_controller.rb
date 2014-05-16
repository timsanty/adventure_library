class LibrariesController < ApplicationController

	def create
		response = Typhoeus.get( url+'.json', params: {title: params[:title], message: params[:message]})
	end
end
