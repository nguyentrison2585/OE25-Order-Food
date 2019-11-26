class RemoveImageFromRestaurants < ActiveRecord::Migration[6.0]
  def change

    remove_column :restaurants, :image, :string
  end
end
