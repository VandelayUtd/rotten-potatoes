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
        @user_movie = current_user.user_movies.find_by(movie_id: params[:id])
        @user_movies = current_user.user_movies
    end

    def update
        # binding.pry
        @user_movie = current_user.user_movies.find_by(movie_id: params[:user_movie][:movie_id])
        # binding.pry
        @user_movie.update(user_movie_params)
        redirect_to user_path(current_user)
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