class AddColumnToEngineers < ActiveRecord::Migration[6.0]
  def change
    add_column :engineers, :profile, :text
    add_column :engineers, :language_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
