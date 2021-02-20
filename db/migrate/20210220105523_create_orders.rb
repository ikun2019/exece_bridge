class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :request, foreign_key: true
      t.references :engineer, foreign_key: true
      t.timestamps
    end
  end
end
