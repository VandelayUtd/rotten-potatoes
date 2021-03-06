class MoviesController < ApplicationController


    def index
        
    end

    def new 
        @movie = Movie.new
        @movie.user_movies.build
        @id = session[:user_id]
        flash[:notice] = "no reviews"
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
            redirect_to movie_path(movie), alert: "movie already exists, add below"
        end
    end

    def show
        @movie = Movie.find(params[:id])
        @user = current_user
        @new_user_movie = @movie.user_movies.build
        @user_movie = current_user.user_movies.find_by(movie_id: params[:id])
        # byebug
        # redirect_to "/"
    end

    private 

    def movie_params 
        params.require(:movie).permit(:title, user_movies_attributes: [:watched, :user_id] )
    end
    

end
