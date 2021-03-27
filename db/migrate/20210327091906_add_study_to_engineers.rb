class AddStudyToEngineers < ActiveRecord::Migration[6.0]
  def change
    add_column :engineers, :study, :boolean, default: "1"
  end
end
