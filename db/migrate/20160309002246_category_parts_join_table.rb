class CategoryPartsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :parts, :categories do |t|
      t.integer :part_id
      t.integer :cateory_id
    end 
  end
end
