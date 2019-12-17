class AddRestaurantRefToOreders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :restaurant, index:true
  end
end
