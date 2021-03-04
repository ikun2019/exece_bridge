class CreateCompletes < ActiveRecord::Migration[6.0]
  def change
    create_table :completes do |t|
      t.references :request, foreign_key: true
      t.boolean  :conclusion, default: false, null: false
      t.references :engineer, foreign_key: true
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
