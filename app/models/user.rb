class User < ApplicationRecord
    has_many :movies 
    has_many :movie_reviews
    has_many :reviews, through: :movie_reviews
end
