class CreateAgreements < ActiveRecord::Migration[6.0]
  def change
    create_table :agreements do |t|
      t.references :request, foreign_key: true
      t.references :engineer, foreign_key: true
      t.references :order, foreign_key: true
      t.boolean :answer, default: false
      t.timestamps
    end
  end
end
