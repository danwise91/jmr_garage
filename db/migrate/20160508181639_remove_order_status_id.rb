class RemoveOrderStatusId < ActiveRecord::Migration
  def change
    remove_column :orders, :order_status_id
  end
end
