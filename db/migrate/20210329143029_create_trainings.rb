class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :title, null: false
      t.text :detail, null: false
      t.timestamps
    end
  end
end
