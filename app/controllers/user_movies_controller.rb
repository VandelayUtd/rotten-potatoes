class UserMoviesController < ApplicationController

    # def new
    #     @user_movie = UserMovie.new
    # end

    def create
        @user_movie = UserMovie.new(user_movie_params)
        @user_movie.save 
        redirect_to "/"
    end

    def edit
        @user_movies = current_user.user_movies   
    end

    def update
        @user_movies = current_user.user_movies
        @user_movies.each do |movie| 
            movie.update(user_movie_params) 
        end
        redirect_to "/edit_list"
    end

    def destroy 
        UserMovie.find(params[:id]).destroy
        redirect_to "/edit_list"
    end

    private 

    def user_movie_params
        params.require(:user_movie).permit(:movie_id, :user_id, :watched)
    end

end