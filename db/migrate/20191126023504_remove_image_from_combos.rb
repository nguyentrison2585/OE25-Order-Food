class RemoveImageFromCombos < ActiveRecord::Migration[6.0]
  def change

    remove_column :combos, :image, :string
  end
end
