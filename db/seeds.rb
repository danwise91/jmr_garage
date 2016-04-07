# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Part.destroy_all
part1 = Part.create! name: "XO Muffler", price: 40, active: true
part2 = Part.create! name: "Super turbo", price: 100, active: true
part3 = Part.create! name: "Speed brakes", price: 50, active: true
part4 = Part.create! name: "Super Muffler", price: 100, active: true

Category.destroy_all
cat1 = Category.create! name: "Acura"
cat2 = Category.create! name: "BMW"
cat3 = Category.create! name: "Ford"
Category.create! name: "Honda"
Category.create! name: "Hyundai"
Category.create! name: "Infiniti"
Category.create! name: "Lexus"
Category.create! name: "Mazda"
Category.create! name: "Mitshubishi"
Category.create! name: "Subaru"
Category.create! name: "Toyota"
Category.create! name: "Porsche"
Category.create! name: "VW"
Category.create! name: "Mini"
Category.create! name: "Wheels"

cat1.parts << part1
cat1.save

cat2.parts << part2
cat2.save

cat3.parts << part3
cat3.save

OrderStatus.delete_all
OrderStatus.create! name: "In Progress"
OrderStatus.create! name: "Placed"
OrderStatus.create! name: "Shipped"
OrderStatus.create! name: "Cancelled"
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
