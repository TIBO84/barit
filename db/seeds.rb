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

puts "............ SEEDS STARTING"

haddress = {
"lyon" => [
"Boulevard des Canuts",
"Rue des Capucins",
"Montée des Carmélites",
"Place Carnot",
"Rue du Président Carnot",
"Place des Célestins",
"Cours Charlemagne",
"Rue des Chartreux",
"Rue Chevreul",
"Rue Claudia",
"Rue Constantine",
"Rue de Créqui",
"Place Croix-Paquet",
"Boulevard de la Croix-Rousse",
"Grande rue de la Croix-Rousse",
"Place de la Croix-Rousse",
"Rue Marietton",
"Rue des Marronniers",
"Rue de Marseille",
"Rue Molière",
"Rue Montgolfier",
"Rue Monseigneur-Lavarenne",
"Rue Mazard",
"Rue Mercière",
"Rue de Montbrillant",
"Rue Malesherbes",
"Rue Terme",
"Place des Terreaux",
"Avenue Thiers",
"Passage Thiaffait",
"Rue Thomassin",
"Avenue Tony-Garnier",
"Place de la Trinité",
"Place de Trion",
"Rue de Trion",
"Rue Tronchet",
"Impasse Turquet"],
"nantes" => [
"Rue Alfred-de-Musset",
"Rue Alfred-Kastler",
"Place Alfred-Lallié",
"Rue Alfred-Riom",
"Rue d'Alger",
"Boulevard Allard",
"Rue de l'Allier",
"Rue d'Allonville",
"Rue de l'Allouée",
"Rue des Alouettes",
"Rue Alphonse-Gautté",
"Rue Amédée-Ménard",
"Boulevard des Américains",
"Boulevard Amiral-Courbet",
"Rue Amiral-du-Chaffault",
"Rue Amiral-Ronarc'h",
"Rue Anatole-de-Monzie",
"Rue Anatole-Le-Braz",
"Rue de l'Ancienne-Monnaie",
"Rue d'Ancin",
"Quai André-Morice",
"Quai André-Rhuys",
"Rue André-Tardieu",
"Allée Andrée-Putman",
"Rue de l'Angélique-des-Estuaires",
"Boulevard des Anglais",
"Rue Anizon",
"Rue d'Anjou",
"Rue Anne-Mandeville"],
"montpellier" => [
"Rue Alfred de Musset",
"Rue Alfred de Vigny",
"Rue Alfred Jarry",
"Rue Alfred Koestler",
"Rue Alfred Legal",
"Rue Alfred Nobel",
"Rue Ali Ben Chekhal",
"Rue Alphonse Allais",
"Rue Alphonse Tavan",
"Rue Ambroise Pare",
"Rue Amoreux Rue Amy Mollisson"]
}

puts "............ CREATING 5 USERS"
o1 = User.create!(first_name: "Thibault", last_name: "Dissé", email: "o1@wagon.com", password:"secret")
o2 = User.create!(first_name: "Mael", last_name: "Efant", email: "o2@wagon.com", password:"secret")

u1 = User.create!(first_name: "Richard", last_name: "Dassault", email: "u1@wagon.com", password:"secret")
u2 = User.create!(first_name: "Jo", last_name: "Zéfine", email: "u2@wagon.com", password:"secret")
u3 = User.create!(first_name: "Cassandre", last_name: "Ié", email: "u3@wagon.com", password:"secret")
mood = %w[electro punk reggae hip-hop jazz]
villes = %w[lyon montpellier nantes]

owners = [o1, o2]
renters = [u1, u2, u3]

puts "............ CREATING 30 BARS"
30.times do |i|
  ville = villes.sample
  file = open("image_compress/bar_#{i+1}.jpg")
  bar = Bar.new(
    name: "#{Faker::Company.name}",
    capacity: rand(4..150),
    ambiance: mood.sample,
    address: "#{rand(1..30)} #{haddress["#{ville}"].sample}",
    city: ville,
    price: rand(200..2000),
    description: "#{Faker::Restaurant.description}",
    owner_id: owners.sample.id
  )
  bar.photo.attach(io: file, filename: "bar_#{i+1}.jpg", content_type: 'image/jpg')
  bar.save!
end

# 10.times do |i|
#   file = open("image_compress/bar_#{11+i}.jpg")
#   bar = Bar.new(
#     name: "#{Faker::Company.name}",
#     capacity: rand(10..150),
#     ambiance: mood.sample,
#     address: ,
#     city: villes.sample,
#     price: "#{Faker::Commerce.price(range: 0..2000)}",
#     description: "#{Faker::Restaurant.description}",
#     owner_id: u1.id
#   )
#   bar.photo.attach(io: file, filename: "bar_#{11+i}.jpg", content_type: 'image/jpg')
#   bar.save!
# end

# 10.times do |i|
#   file = open("image_compress/bar_#{21+i}.jpg")
#   bar = Bar.new(
#     name: "#{Faker::Company.name}",
#     capacity: rand(10..150),
#     ambiance: mood.sample,
#     address: "#{Faker::Address.street_address}",
#     city: villes.sample,
#     price: "#{Faker::Commerce.price(range: 0..2000)}",
#     description: "#{Faker::Restaurant.description}",
#     owner_id: u1.id
#   )
#   bar.photo.attach(io: file, filename: "bar_#{21+i}.jpg", content_type: 'image/jpg')
#   bar.save!
# end


file = open("image_compress/bar_31.jpg")
b1 = Bar.new(name:"Le Wagon", capacity: 5, ambiance: "HOT XXX", address: "20 rue des capucins", city: "lyon", owner_id: o1.id)
b1.photo.attach(io: file, filename: "bar_31.jpg", content_type: 'image/jpg')
b1.save!

res1 = Reservation.create!(date: Date.today, user_id: o2.id, bar_id: b1.id)

rev1 = Review.create!(user_id: o2.id, bar_id: b1.id, rating: 4, content: "this is a beautifull day")

puts "............ CREATING 10 REVIEWS FOR EACH BAR"

bars = Bar.all

bars.each do |bar|
  10.times do
    Review.create!(
      user_id: renters.sample.id ,
      bar_id: bar.id,
      content: Faker::Restaurant.review,
      rating: rand(0..5)
    )
  end
end

# review_1  = Review.create!(user_id: o2.id, bar_id: b1.id, content:"this bar is fucking awesome" , rating: 5)
# review_2 = Review.create!(user_id: o2.id, bar_id: b1.id, content:"this bar sucks" , rating: 2)
# review_3 = Review.create!(user_id: o2.id, bar_id: b1.id, content:"Great night ! Thank you Richard and Maël !" , rating: 4)
# review_4  = Review.create!(user_id: o1.id, bar_id: b1.id, content:"Best party ever in this place" , rating: 5)
# review_5  = Review.create!(user_id: o1.id, bar_id: b1.id, content:"Would have been perfect with more beers" , rating: 3)


puts "............ SEED OK"
