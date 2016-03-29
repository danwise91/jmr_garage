class AddQuantityAndSubtotalToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :quantity, :integer
    add_column :carts, :subtotal, :decimal
  end
end
