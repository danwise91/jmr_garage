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

  def paypal_url(return_url)
  values = {
    :business => 'jmrgarage@gmail.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id
  }
  line_items.each_with_index do |item, index|
    values.merge!({
      "item_name_#{index+1}" => item.part.name,
      "item_number_#{index+1}" => item.part.id,
      "quantity_#{index+1}" => item.quantity
    })
  end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end

end
