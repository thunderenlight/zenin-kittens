class KittensController < ApplicationController
	respond_to :html, :json

	def index
		@kittens = Kitten.all
		respond_to do |format|
			format.json {render json: @kittens }
			format.html { respond_with @kittens }
		end
	end


	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten #{@kitten.name} has been created!"
			redirect_to @kitten
		else
			render 'new'
		end
	end

	def new
		@kitten = Kitten.new 
	end



	def edit
		@kitten = Kitten.find(params[:id])
	end

	def show
		@kitten = Kitten.find(params[:id])

		respond_to do |format|
			format.json {render json: @kitten}
			format.html {respond_with @kitten}
		end
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update(kitten_params)
			flash[:sucesss] = "Kitten #{@kitten.name} has been updated!"
			redirect_to @kitten
		else
			render 'edit'
		end

	end


	def destroy
		@kitten = Kitten.find(params[:id])
		@kitten.delete
		flash.now[:notice] = "Are you certain, you really want to remove a helpless kitten?"
		redirect_to(root_path)

	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness, :toughness, :description)
	end

end
