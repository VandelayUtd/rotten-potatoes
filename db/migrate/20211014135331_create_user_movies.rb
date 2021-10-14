class CreateUserMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_movies do |t|
      t.boolean :watched, default: :false
      t.integer :user_id
      t.integer :movie_id
      t.timestamps
    end
  end
end
