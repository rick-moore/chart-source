class CreateSetlistShares < ActiveRecord::Migration[6.1]
  def change
    create_table :setlist_shares do |t|
      t.integer :team_id
      t.integer :setlist_id

      t.timestamps
    end
  end
end
