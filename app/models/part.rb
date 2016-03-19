class Part < ActiveRecord::Base
  has_many :order_items
  belongs_to :category
  default_scope { where(active: true)}

  validate :image_size_validation
  mount_uploader :image, ImageUploader

  def apply_discount
    price - (discount.to_f/100 * price)
  end

  def self.search(search)
  if search
    self.where("name like ?", "%#{search}%")
  else
    self.all
    end
  end
  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
