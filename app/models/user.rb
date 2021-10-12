class User < ApplicationRecord
    # has_many :user_movies 
    # has_many :movies, through: :user_movies
    has_many :reviews
    has_many :movies 
    has_many :reviewed_movies, through: :reviews, source: :movie
end
