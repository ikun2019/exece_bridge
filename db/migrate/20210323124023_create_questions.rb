class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :engineer, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
