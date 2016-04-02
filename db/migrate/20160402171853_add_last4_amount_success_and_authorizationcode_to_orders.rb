class AddLast4AmountSuccessAndAuthorizationcodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :last4, :string
    add_column :orders, :amount, :decimal12
    add_column :orders, :amount, :decimal3
    add_column :orders, :success, :boolean
    add_column :orders, :authorization_code, :string
  end
end
