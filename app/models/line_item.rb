class LineItem < ActiveRecord::Base
  belongs_to :part
  belongs_to :cart

  def total_price
    part.price * quantity
  end

  def line_item_discount
    part.price - (part.discount.to_f/100 * part.price) * quantity
  end

end
