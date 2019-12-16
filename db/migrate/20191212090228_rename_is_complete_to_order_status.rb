class RenameIsCompleteToOrderStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :is_complete, :status
  end
end
