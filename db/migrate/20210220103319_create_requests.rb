class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :customer_id, null: false
      t.string :title, null: false
      t.text  :content, null: false
      t.integer :budget_id, null: false
      t.integer :term_id, null: false
      t.integer :approach_id, null: false
      t.text :other
      t.timestamps
    end
  end
end
