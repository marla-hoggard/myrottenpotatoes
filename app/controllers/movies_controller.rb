class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def new
		@movie = Movie.new
	end

	def create
		params.require(:movie)
		permitted = params[:movie].permit(:title, :rating, :release_date)
		@movie = Movie.create!(permitted)
		flash[:notice] = "'#{@movie.title}'' was successfully created."
		redirect_to movies_path
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		params.require(:movie)
		permitted = params[:movie].permit(:title, :rating, :release_date)

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
