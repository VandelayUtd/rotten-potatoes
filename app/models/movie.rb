class Movie < ApplicationRecord

    has_many :reviews
    has_many :reviewers, through: :reviews, source: :user
    has_many :user_movies 
    has_many :users, through: :user_movies

    accepts_nested_attributes_for :user_movies



    def rating_avg
        if self.reviews.size > 0
        ratings = self.reviews.map {|r| r.rating }
        ratings.sum / ratings.size
        else   
            0
        end
    end

    def self.sorted_by_rating
        self.all.sort_by{|movie| movie.rating_avg}.reverse
    end

end
