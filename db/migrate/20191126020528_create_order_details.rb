class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :order_detailable_id
      t.string :order_detailable_type
      t.integer :count
      t.integer :amount

      t.timestamps
    end
  end
end
