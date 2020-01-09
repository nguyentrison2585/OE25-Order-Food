class AddPriceToCombos < ActiveRecord::Migration[6.0]
  def change
    add_column :combos, :price, :integer
  end
end
