# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Part.destroy_all
part1 = Part.create! id: 1, name: "XO Muffler", price: 40, active: true
part2 = Part.create! id: 2, name: "Super turbo", price: 100, active: true
part3 = Part.create! id: 3, name: "Speed brakes", price: 50, active: true
part4 = Part.create! id: 4, name: "Super Muffler", price: 100, active: true 

Category.destroy_all
cat1 = Category.create! id: 2, name: "Acura"
cat2 = Category.create! id: 3, name: "BMW"
cat3 = Category.create! id: 4, name: "Ford"
Category.create! id: 5, name: "Honda"
Category.create! id: 6, name: "Hyundai"
Category.create! id: 7, name: "Infiniti"
Category.create! id: 8, name: "Lexus"
Category.create! id: 9, name: "Mazda"
Category.create! id: 10, name: "Mitshubishi"
Category.create! id: 11, name: "Subaru"
Category.create! id: 12, name: "Toyota"
Category.create! id: 13, name: "Porsche"
Category.create! id: 14, name: "VW"
Category.create! id: 15, name: "Mini"
Category.create! id: 16, name: "Wheels"

cat1.parts << part1
cat1.save

cat2.parts << part2
cat2.save

cat3.parts << part3
cat3.save

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
