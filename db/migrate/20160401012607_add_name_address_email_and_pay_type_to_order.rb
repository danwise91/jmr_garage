class AddNameAddressEmailAndPayTypeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :address, :text
    add_column :orders, :email, :string
    add_column :orders, :pay_type, :string
  end
end
