class Parts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.text :description
    end 
  end
end
