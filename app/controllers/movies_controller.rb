class MoviesController < ApplicationController

    def new 
        @movie = Movie.new
        @movie.user_movies.build
        @id = session[:user_id]
    end

    def create 
        if !Movie.find_by(title: movie_params[:title])
            movie = current_user.movies.build(movie_params)
            if movie.save 
                redirect_to movie_path(movie)
            else 
                render "new"
            end
        else
            movie = Movie.find_by(title: movie_params[:title])
        end
    end

    def show 
        @movie = Movie.find(params[:id])
        @user = current_user
    end

    private 

    def movie_params 
        params.require(:movie).permit(:title, user_movies_attributes: [:watched, :user_id] )
    end
    

end
