class RemoveImageFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :image
  end
end
