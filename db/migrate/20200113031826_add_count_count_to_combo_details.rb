class AddCountCountToComboDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :combo_details, :count, :integer
  end
end
