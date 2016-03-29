class CombinePartsInCart < ActiveRecord::Migration
  def change
    def up
      Cart.all.each do |cart|
        sum = cart.line_items.group(:part_id).sum(:quantity)
        sums.each do |part_id, quantity|
          if quantity > 1
            cart.line_items.where(part_id: part_id).delete_all

            item = cart.line_items.build(part_id: part_id)
            item.quantity = quantity
            item.save!

          def down
            LineItem.where("quantity>1").each do |line_item|
              line_item.quantity.times do
                LineItem.create cart_id: line_item.cart_id,
                part_id: line_item.part_id, quantity: 1
              end
              line_item.destroy
            end
          end
            end
          end
        end
      end
    end
end
