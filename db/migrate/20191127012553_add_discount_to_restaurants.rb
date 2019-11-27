class AddDiscountToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :discount, :integer
  end
end
