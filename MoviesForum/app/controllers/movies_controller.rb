class MoviesController < ApplicationController
	def search
		render 'search_form'
	end

	def search_movies
		@movies = Movie.where("title like ?", "%#{params[:movie_name]}%")
		if(@movies.empty?)
			@movies = (Imdb::Search.new(params[:movie_name])).movies
		end
		#binding.pry
		render 'show_movies'
	end

	def show
		@movie = Movie.find_by(title: params[:title])

		if !check_if_movie_exist @movie
			@movie = ((Imdb::Search.new(params[:title].gsub(/\(.*\)/, ""))).movies)[0]
			@movie = save_movie(@movie)
		end
		render 'show'
	end

	private

	def check_if_movie_exist movie
		!movie==nil
	end

	def save_movie movie
    Movie.create!(title: movie.title, year: movie.year, synopsis: movie.plot)
	end
end
