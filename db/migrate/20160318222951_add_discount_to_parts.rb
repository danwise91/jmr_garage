class AddDiscountToParts < ActiveRecord::Migration
  def change
    add_column :parts, :discount, :integer, :default => nil 
  end
end
