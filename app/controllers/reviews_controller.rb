class ReviewsController < ApplicationController

    def new

        # redirect_to "/" if params[:user_id] != current_user.id || params[:movie_id] != @movie.id
        @review = Review.new
        @movie = Movie.find(params[:movie_id])
        @user = current_user
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to movie_path(@review.movie)
        end
    end

    def edit 
        @review = Review.find(params[:id])
        @movie = Movie.find(params[:movie_id])
        @user = current_user
    end

    def update 
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to movie_path(@review.movie)
    end

    private 

    def review_params
        params.require(:review).permit(:rating, :content, :movie_id, :user_id)
    end

end
