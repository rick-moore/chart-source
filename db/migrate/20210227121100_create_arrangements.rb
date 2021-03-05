class CreateArrangements < ActiveRecord::Migration[6.1]
  def change
    create_table :arrangements do |t|
      t.integer :owner_id
      t.integer :song_id
      t.integer :arranger_id
      t.integer :artist_id
      t.string :key
      t.integer :tempo

      t.timestamps
    end
  end
end
