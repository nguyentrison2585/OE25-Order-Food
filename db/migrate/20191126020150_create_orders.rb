class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.datetime :date_time
      t.integer :is_complete
      t.integer :total_money
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
