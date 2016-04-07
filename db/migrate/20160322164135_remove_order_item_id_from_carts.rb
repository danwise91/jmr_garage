class RemoveOrderItemIdFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :order_item_id, :integer
  end
end
