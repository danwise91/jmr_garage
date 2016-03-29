class Cart < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def add_part(part_id)
    current_part = line_items.find_by(part_id: part_id)
    if current_part
      current_part.quantity += 1
    else
      current_part = line_items.build(part_id: part_id)
    end
    current_part
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end 
end
