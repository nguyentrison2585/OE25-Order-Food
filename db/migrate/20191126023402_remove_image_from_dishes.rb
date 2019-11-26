class RemoveImageFromDishes < ActiveRecord::Migration[6.0]
  def change

    remove_column :dishes, :image, :string
  end
end
