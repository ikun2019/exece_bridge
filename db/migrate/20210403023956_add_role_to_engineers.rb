class AddRoleToEngineers < ActiveRecord::Migration[6.0]
  def change
    add_column :engineers, :role, :integer, null: false, default: 0
  end
end
