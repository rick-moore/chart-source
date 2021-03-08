class CreateCharts < ActiveRecord::Migration[6.1]
  def change
    create_table :charts do |t|
      t.string :instrument
      t.integer :arrangement_id

      t.timestamps
    end
  end
end
