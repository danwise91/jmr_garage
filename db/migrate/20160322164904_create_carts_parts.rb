class CreateCartsParts < ActiveRecord::Migration
  def change
    create_table :carts_parts, id: false do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :part, index: true
    end
  end
end
