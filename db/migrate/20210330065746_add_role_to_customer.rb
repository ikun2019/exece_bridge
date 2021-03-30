class AddRoleToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :role, :integer, null: false, default: 0
  end
end
