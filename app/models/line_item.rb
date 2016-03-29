class LineItem < ActiveRecord::Base
  belongs_to :part
  belongs_to :cart

  def total_price
    part.price * quantity
  end
  
end
