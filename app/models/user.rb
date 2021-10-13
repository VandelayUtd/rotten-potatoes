class User < ApplicationRecord
 
    has_many :reviews
    has_many :movies 
    has_many :reviewed_movies, through: :reviews, source: :movie

    has_secure_password
    validates_presence_of :name, :username
    validates_uniqueness_of :username
end
