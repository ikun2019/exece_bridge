class AddPayjpcolumnToEngineers < ActiveRecord::Migration[6.0]
  def change
    add_column :engineers, :subscription_id, :string
    add_column :engineers, :premium, :boolean, default: false, null: false
  end
end
