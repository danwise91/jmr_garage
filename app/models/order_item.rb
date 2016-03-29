class OrderItem < ActiveRecord::Base
  belongs_to :part
  belongs_to :order
  belongs_to :cart 

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :part_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    elsif part.discount?
      part.apply_discount
    else
      part.price
    end
  end



  def total_with_discount
    part.apply_discount * quantity
  end

  def total_price
    unit_price * quantity
  end

  #create a total_with_discount method here

private
  def part_present
    if part.nil?
      errors.add(:part, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
