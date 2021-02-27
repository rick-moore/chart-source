class CreateArrangements < ActiveRecord::Migration[6.1]
  def change
    create_table :arrangements do |t|
      t.integer :song_id
      t.integer :arranger_id
      t.string :key
      t.integer :tempo
      t.integer :owner_id

      t.timestamps
    end
  end
end
