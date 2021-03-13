class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :rate, null: false
      t.references :customer, foreign_key: true
      t.references :engineer, foreign_key: true
      t.text :customer_comment
      t.timestamps
    end
  end
end
