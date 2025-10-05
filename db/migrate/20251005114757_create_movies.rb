class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.timestamps
      t.string :title
      t.datetime :watched_at
    end
  end
end
