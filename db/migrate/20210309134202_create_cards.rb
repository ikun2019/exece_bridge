class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer :engineer_id
      t.string :payjp_customer_id
      t.string :card_id
      t.timestamps
    end
  end
end
