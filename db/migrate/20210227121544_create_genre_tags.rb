class CreateGenreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_tags do |t|
      t.integer :genre_id
      t.integer :arrangement_id

      t.timestamps
    end
  end
end
