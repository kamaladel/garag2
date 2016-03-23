# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
cars = ["bmw","subaru","mercedes","nissan","Golf","audi","Honda"]

first_names = ["Kamal","Mahmoud","Ahmad","Amjad","marzooq","Avi"]
last_names = ["Agbareiah","Mahajna","Golden","Levi","Jabareen","Mahameed"]
titles = ["Breakes","Cpmputer Check","Absar shu","ha7lafat teez","batee5","ha5ana la test"]
descriptions = ["desc1","desc2","desc3","desc4","desc5","desc6"]

10.times {

first_name = first_names[rand(0..5)]
last_name = last_names[rand(0..5)]
phone = "0500000000"
car = cars[rand(0..cars.length)]
year = rand(2000...2015)
km = rand(50000..250000)
car_number = rand(1111111..9999999)

owner1 = Owner.create(name: first_name + "  " + last_name, phone: phone, email: "k@k.com",  car_number: car_number, car_type: car, car_year: year)

items = []
for i in 0..3
	title = titles[rand(0..5)]

price = rand(50..1000)
description = descriptions[rand(0..5)]

	items << Item.create(title: title, description: description, price: price)

end

open = [true,false]
v1 = Visit.create(open: open[rand(0..1)],owner_id: owner1.id)
v1.items << items


}


