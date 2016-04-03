class Part < ActiveRecord::Base
  has_many :order_items
  has_many :line_items
  has_many :comments 

  before_destroy :ensure_not_referenced_by_any_line_item

  belongs_to :category
  default_scope { where(active: true)}

  validate :image_size_validation
  mount_uploader :image, ImageUploader

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
end


  def subtotal
    parts.collect { |part| part.valid? ? (part.quantity * part.unit_price) : 0}.sum
  end


  def apply_discount
    price - (discount.to_f/100 * price)
  end

  def self.search(search)
  if search
    self.where("name ilike ?", "%#{search}%")
  else
    self.all
    end
  end
  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
