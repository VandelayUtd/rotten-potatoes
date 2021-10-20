class User < ApplicationRecord
 
    has_many :reviews
    has_many :user_movies
    has_many :movies, through: :user_movies
    has_many :reviewed_movies, through: :reviews, source: :movie

    has_secure_password
    validates_presence_of :name, :username
    validates_uniqueness_of :username

    def self.create_by_github(auth_hash)
        self.find_or_create_by(username: auth_hash[:info][:nickname]) do |u|
          u.password = SecureRandom.hex
        end
    end

end
