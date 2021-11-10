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
            @movie = Movie.find(params[:movie_id])
            @user = User.find(params[:user_id])
            if current_user.id != @user.id
                flash[:unauthorized] = "You can only edit your own reviews"
                redirect_to movie_path(@movie)
            end
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
