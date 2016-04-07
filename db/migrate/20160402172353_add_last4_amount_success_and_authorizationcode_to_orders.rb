class AddLast4AmountSuccessAndAuthorizationcodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :last4, :string
    add_column :orders, :success, :boolean
    add_column :orders, :authorization_code, :string
    add_column :orders, :amount, :decimal
  end
end
