class Movie < ApplicationRecord
    # has_many :user_movies 
    # has_many :users, through: :user_movies

    has_many :reviews
    has_many :reviewers, through: :reviews, source: :user
    has_many :user_movies 
    has_many :users, through: :user_movies

    accepts_nested_attributes_for :user_movies
    # def user_movies_attributes=(attributes)
    #     self.user_movies.build(watched: attributes[:watched], user_id: attributes[:user_id])
    # end 



    def rating_avg
        if self.reviews.size > 0
        ratings = self.reviews.map {|r| r.rating }
        ratings.sum / ratings.size
        else   
            nil 
        end
    end

    def self.sorted_by_rating
        self.all.sort_by{|movie| movie.rating_avg}
    end

end
