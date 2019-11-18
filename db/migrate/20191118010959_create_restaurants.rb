class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :open_time
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
