class AddPriceAndActiveToParts < ActiveRecord::Migration
  def change
    add_column :parts, :price, :integer
    add_column :parts, :active, :boolean
  end
end
