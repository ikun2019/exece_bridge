class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.references :engineer, foreign_key: true
      t.text :answer, null: false
      t.integer :rate
      t.timestamps
    end
  end
end
