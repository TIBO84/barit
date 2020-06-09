# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts ".... SEEDS STARTING"
User.destroy_all
Review.destroy_all
Bar.destroy_all
Reservation.destroy_all

u1 = User.create!(first_name: "Thibault", last_name: "le beau gosse", email: "u1@wagon.com", password:"secret")

u2 = User.create!(first_name: "Mael", last_name: "Le prince", email: "u2@wagon.com", password:"secret")

u3 = User.create!(first_name: "Richard", last_name: "La belle vie", email: "u3@wagon.com", password:"secret")

b1 = Bar.create!(name:"Le Wagon", capacity: 5, ambiance: "hot", address: "rue des capucins", city: "lyon", owner_id: u1.id)

mood = %w[electro punk reggae hip-hop jazz]
villes = %w[lyon montpellier paris nantes]
10.times do |i|
  Bar.create!(name:"bar#{i}", capacity: i*2, ambiance: mood.sample, address: "#{i} rue des Capucins", city: villes.sample, owner_id: u1.id)
end

b1.owner_id = u1.id

res1 = Reservation.create!(date: Date.today, user_id: u2.id, bar_id: b1.id)

rev1 = Review.create!(user_id: u2.id, bar_id: b1.id, rating: 4, content: "this is a beautifull day")

puts ".... SEEDS OK"
