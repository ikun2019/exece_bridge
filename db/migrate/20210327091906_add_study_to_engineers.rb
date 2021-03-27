class AddStudyToEngineers < ActiveRecord::Migration[6.0]
  def change
    add_column :engineers, :study_id, :integer, default: "1"
  end
end
