class MoviesController < ApplicationController

    def new 
        @movie = Movie.new 
    end

    def create 
        @movie = Movie.new(movie_params)
        if @movie.save 
            redirect_to movie_path(@movie)
        else 
            render "new"
        end
    end

    def show 
        @movie = Movie.find(params[:id])
    end

    private 

    def movie_params 
        params.require(:movie).permit(:title, :watched, :user_id )
    end

end
