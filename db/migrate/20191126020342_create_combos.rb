class CreateCombos < ActiveRecord::Migration[6.0]
  def change
    create_table :combos do |t|
      t.string :name
      t.string :image
      t.string :description
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
