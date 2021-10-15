class ReviewsController < ApplicationController

    def new 
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
    end

    def update 
        
    end

    private 

    def review_params
        params.require(:review).permit(:rating, :content, :movie_id, :user_id)
    end

end
