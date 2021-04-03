class RemoveColumnToCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :role, :integer
  end
end
