class CreateSetEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :set_entries do |t|
      t.integer :setlist_id
      t.integer :arrangement_id

      t.timestamps
    end
  end
end
