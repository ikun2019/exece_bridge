class AddEngineeridToCompletes < ActiveRecord::Migration[6.0]
  def change
    add_reference :completes, :engineer, foreign_key: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
