class AddImageToParts < ActiveRecord::Migration
  def change
    add_column :parts, :image, :string
  end
end
