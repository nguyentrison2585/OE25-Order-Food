class CreateComboDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :combo_details do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :combo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
