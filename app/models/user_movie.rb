class UserMovie < ApplicationRecord
    belongs_to :user
    belongs_to :movie

    scope :has_watched, -> {where(watched: true) } 

    def user_movie_title
        Movie.find_by(id: self.movie_id).title
    end

end
