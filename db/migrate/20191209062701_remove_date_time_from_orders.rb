class RemoveDateTimeFromOrders < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :date_time, :datetime
  end
end
