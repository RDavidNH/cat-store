# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all

12.times do |index|
	item = Item.create(
		title: Faker::Lorem.sentence(word_count: 2),
		description: Faker::Lorem.sentence(word_count: 3),
		price: (index + 1),
		image_url: " "
	)
end

3.times do |i|
	user = User.create(
		email: "admin#{i}@yopmail.com",
		password: "adminadmin"
	)
end