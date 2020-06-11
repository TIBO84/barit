# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Bar.destroy_all
Reservation.destroy_all
Review.destroy_all
User.destroy_all

puts ".... SEEDS STARTING"

u1 = User.create!(first_name: "Thibault", last_name: "le beau gosse", email: "u1@wagon.com", password:"secret")
u2 = User.create!(first_name: "Mael", last_name: "Le prince", email: "u2@wagon.com", password:"secret")
u3 = User.create!(first_name: "Richard", last_name: "La belle vie", email: "u3@wagon.com", password:"secret")

mood = %w[electro punk reggae hip-hop jazz]
villes = %w[lyon montpellier paris nantes]


10.times do |i|
  file = open("image_compress/bar_#{i+1}.jpg")
  bar = Bar.new(
    name: "#{Faker::Company.name}",
    capacity: rand(10..150),
    ambiance: mood.sample,
    address: "#{Faker::Address.street_address}",
    city: villes.sample,
    price: "#{Faker::Commerce.price(range: 0..2000)}",
    description: "#{Faker::Restaurant.description}",
    owner_id: u1.id
  )
  bar.photo.attach(io: file, filename: "bar_#{i+1}.jpg", content_type: 'image/jpg')
  bar.save!
end

10.times do |i|
  file = open("image_compress/bar_#{11+i}.jpg")
  bar = Bar.new(
    name: "#{Faker::Company.name}",
    capacity: rand(10..150),
    ambiance: mood.sample,
    address: "#{Faker::Address.street_address}",
    city: villes.sample,
    price: "#{Faker::Commerce.price(range: 0..2000)}",
    description: "#{Faker::Restaurant.description}",
    owner_id: u2.id
  )
  bar.photo.attach(io: file, filename: "bar_#{11+i}.jpg", content_type: 'image/jpg')
  bar.save!
end

10.times do |i|
  file = open("image_compress/bar_#{21+i}.jpg")
  bar = Bar.new(
    name: "#{Faker::Company.name}",
    capacity: rand(10..150),
    ambiance: mood.sample,
    address: "#{Faker::Address.street_address}",
    city: villes.sample,
    price: "#{Faker::Commerce.price(range: 0..2000)}",
    description: "#{Faker::Restaurant.description}",
    owner_id: u3.id
  )
  bar.photo.attach(io: file, filename: "bar_#{21+i}.jpg", content_type: 'image/jpg')
  bar.save!
end


file = open("image_compress/bar_31.jpg")
b1 = Bar.new(name:"Le Wagon", capacity: 5, ambiance: "hot", address: "rue des capucins", city: "lyon", owner_id: u1.id)
b1.photo.attach(io: file, filename: "bar_31.jpg", content_type: 'image/jpg')
b1.save!

res1 = Reservation.create!(date: Date.today, user_id: u2.id, bar_id: b1.id)

rev1 = Review.create!(user_id: u2.id, bar_id: b1.id, rating: 4, content: "this is a beautifull day")

review_1  = Review.create!(user_id: u2.id, bar_id: b1.id, content:"this bar is fucking awesome" , rating: 5)
review_2 = Review.create!(user_id: u2.id, bar_id: b1.id, content:"this bar sucks" , rating: 2)
review_3 = Review.create!(user_id: u2.id, bar_id: b1.id, content:"Great night ! Thank you Richard and Maël !" , rating: 4)
review_4  = Review.create!(user_id: u1.id, bar_id: b1.id, content:"Best party ever in this place" , rating: 5)
review_5  = Review.create!(user_id: u1.id, bar_id: b1.id, content:"Would have been perfect with more beers" , rating: 3)


puts 'Finished!'
