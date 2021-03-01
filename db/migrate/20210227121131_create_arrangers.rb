class CreateArrangers < ActiveRecord::Migration[6.1]
  def change
    create_table :arrangers do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end
end
