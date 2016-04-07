class Category < ActiveRecord::Base
  validates :name, length: {minimum: 1}
  has_many :parts
end
