class LineItem < ActiveRecord::Base
  belongs_to :part
  belongs_to :cart
  scope :with_discounted_part, -> { joins(:part).where.not(part: { discount: nil }) }

  def total_price
    (part.price * quantity) - line_item_discount
  end

  def line_item_discount
    return 0 if part.discount.blank?
    (part.discount.to_f/100*part.price) * quantity
  end

end
