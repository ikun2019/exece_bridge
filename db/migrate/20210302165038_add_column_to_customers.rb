class AddColumnToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :post_code, :string, null: false
    add_column :customers, :prefecture_id, :integer, null: false
    add_column :customers, :city, :string, null: false
    add_column :customers, :house_number, :string, null: false
    add_column :customers, :building_name, :string
    add_column :customers, :phone_number, :string, null: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end