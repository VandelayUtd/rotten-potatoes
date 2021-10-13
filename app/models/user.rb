class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :movies 
    has_many :reviewed_movies, through: :reviews, source: :movie


end
