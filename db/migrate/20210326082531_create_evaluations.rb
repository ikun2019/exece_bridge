class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.references :engineer, foreign_key: true
      t.integer :rate, null: false
      t.timestamps
    end
  end
end
