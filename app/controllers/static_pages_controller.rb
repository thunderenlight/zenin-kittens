class StaticPagesController < ApplicationController
	respond_to :html, :json


	def index
		@kittens = Kitten.all
		if params[:id]
			@id = params[:id]
			
		else
			@id = '135492661@N08'

		end
	end

end
