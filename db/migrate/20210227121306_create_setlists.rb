class CreateSetlists < ActiveRecord::Migration[6.1]
  def change
    create_table :setlists do |t|
      t.string :name
      t.integer :team_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
