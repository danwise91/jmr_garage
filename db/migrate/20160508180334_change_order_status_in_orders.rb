class ChangeOrderStatusInOrders < ActiveRecord::Migration
  def change
    remove_foreign_key :orders, column: :order_status_id
  end
end
