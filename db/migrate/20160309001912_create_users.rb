class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :country
      t.string :state
      t.string :zip
    end
  end
end
