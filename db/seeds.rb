# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Review.destroy_all
Bar.destroy_all
Reservation.destroy_all

u1 = User.create!(first_name: "Thibault", last_name: "le beau gosse", email: "edeecvece@eddfze.com", password:"123456")

u2 = User.create!(first_name: "Mael", last_name: "Le prince", email: "edeecerce@eddfze.com", password:"1234567")

u3 = User.create!(first_name: "Richard", last_name: "La belle vie", email: "edeecece@eddfzze.com", password:"123456")

b1 = Bar.create!(name:"Le Wagon", capacity: 5, ambiance: "hot", address: "rue des capucins", city: "lyon", owner_id: u1.id)

b1.owner_id = u1.id

res1 = Reservation.create!(date: Date.today, user_id: u2.id, bar_id: b1.id)

rev1 = Review.create!(user_id: u2.id, bar_id: b1.id, rating: 4, content: "this is a beautifull day")
