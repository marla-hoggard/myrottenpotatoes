class MoviesController < ApplicationController
	def index
		@movies = Movie.all.order("title")
		# @movies = @movies.sort_by { |m| m.title }
	end

	def show
		begin
			@movie = Movie.find(params[:id])
		rescue	
			flash[:notice] = "No movie with that id exists."
			redirect_to movies_path
		end
	end

	def new
		@movie = Movie.new
	end

	def create
		params.require(:movie)
		permitted = params[:movie].permit(:title, :rating, :release_date, :description)

		@movie = Movie.create!(permitted)
		flash[:notice] = "'#{@movie.title}'' was successfully created."
		redirect_to movie_path(@movie)
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		params.require(:movie)
		permitted = params[:movie].permit(:title, :rating, :release_date, :description)

		@movie = Movie.find(params[:id])
		@movie.update_attributes!(permitted)
		flash[:notice] = "'#{@movie.title}'' was successfully updated."
		redirect_to movie_path(@movie)
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "'#{@movie.title}'' was successfully deleted."
		redirect_to movies_path
	end

end
