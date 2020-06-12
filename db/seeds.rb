require 'faker'

puts "............ DESTROYING DATABASE"
Bar.destroy_all
Reservation.destroy_all
Review.destroy_all
User.destroy_all

puts "............ SEED STARTING"

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
o1 = User.create!(first_name: "Thibault", last_name: "Dissé", email: "thibault@wagon.com", password:"secret")
o2 = User.create!(first_name: "Mael", last_name: "Efant", email: "richard@wagon.com", password:"secret")

u1 = User.create!(first_name: "Richard", last_name: "Dassault", email: "u1@wagon.com", password:"secret")
u2 = User.create!(first_name: "Jo", last_name: "Zéfine", email: "u2@wagon.com", password:"secret")
u3 = User.create!(first_name: "Cassandre", last_name: "Ié", email: "u3@wagon.com", password:"secret")

mood = %w[Electro Punk Reggae Hip-hop Jazz Hot]

villes = %w[lyon montpellier nantes]

owners = [o1, o2]
renters = [u1, u2, u3]

puts "............ CREATING 30 BARS"
24.times do |i|
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


file = open("image_compress/bar_25.jpg")
b1 = Bar.new(name:"Modus Vivendi", capacity: 5, ambiance: "Reggae", address: "107 rue de la République", city: "lyon", owner_id: o1.id, price: 180, description: "They are the self-styled pioneers of jazz in Lyon, and they have the pedigree to prove it: aside from running their own record label, the club has also played host to Barry Harris and Javier Krahe over the years, while Pedro Iturralde once recorded an album here." )
b1.photo.attach(io: file, filename: "bar_25.jpg", content_type: 'image/jpg')
b1.save!


file = open("image_compress/bar_26.jpg")
b2 = Bar.new(name:"Borriquita", capacity: 5, ambiance: "Reggae", address: "28 rue Burdeau", city: "lyon", owner_id: o1.id, price: 230, description: "Tout le monde s'y retrouve pour boire un coup dans une ambiance jeune et décontractée")
b2.photo.attach(io: file, filename: "bar_26.jpg", content_type: 'image/jpg')
b2.save!


file = open("image_compress/bar_27.jpg")
b3 = Bar.new(name:"Momo", capacity: 5, ambiance: "Reggae", address: "3 Rue de la Charité", city: "lyon", owner_id: o1.id, price: 230, description: "This pub’s decoration (including a working traffic light) is full of character, being inspired by Michael Ende’s novel Momo, but being a fan of the book is certainly not a prerequisite for having a good time here. Its spacious terrace has an ambiance all its own, with ample greenery, a bubbling fountain, and spectacular views of the city and its monuments. Inside or out, Momo is a great place to kick back and relax while listening to whatever traveling troubadour may be passing through.")
b3.photo.attach(io: file, filename: "bar_27.jpg", content_type: 'image/jpg')
b3.save!


file = open("image_compress/bar_28.jpg")
b4 = Bar.new(name:"Havana Café", capacity: 5, ambiance: "Reggae", address: "56 Cours Gambetta", city: "lyon", owner_id: o1.id, price: 170, description: "Aïe aïe aïe les amis, au Havana Café, une PURE SOIRÉE s’annonce !!! Un conseil ne vous couvrez pas trop, vous allez avoir chauuuuud !!!!  En seconde partie de soirée, comme d’habitude…c’est Clubbing !")
b4.photo.attach(io: file, filename: "bar_28.jpg", content_type: 'image/jpg')
b4.save!


file = open("image_compress/bar_29.jpg")
b5 = Bar.new(name:"Garoa", capacity: 5, ambiance: "Reggae", address: "59 Rue Chevreul", city: "lyon", owner_id: o1.id)
b5.photo.attach(io: file, filename: "bar_29.jpg", content_type: 'image/jpg')
b5.save!


file = open("image_compress/bar_30.jpg")
b6 = Bar.new(name:"Pub Atlántico", capacity: 5, ambiance: "Reggae", address: "71 Rue Michel Félizat", city: "lyon", owner_id: o1.id)
b6.photo.attach(io: file, filename: "bar_30.jpg", content_type: 'image/jpg')
b6.save!


file = open("image_compress/bar_31.jpg") 
b7 = Bar.new(name:"Le Wagon", capacity: 5, ambiance: "Electro", address: "20 rue des capucins", city: "lyon", owner_id: o1.id)
b7.photo.attach(io: file, filename: "bar_31.jpg", content_type: 'image/jpg')
b7.save!

res1 = Reservation.create!(date: "2020-06-26".to_date, user_id: o2.id, bar_id: b4.id)

rev1 = Review.create!(user_id: o2.id, bar_id: b1.id, rating: 4, content: "this is a beautifull day")

puts "............ CREATING 10 REVIEWS FOR EACH BAR"

bars = Bar.all


bars.each do |bar|
  7.times do
    Review.create!(
      user_id: renters.sample.id ,
      bar_id: b1.id,
      content: Faker::Restaurant.review,
      rating: rand(4..5)
    )
  end
end


bars.each do |bar|
  6.times do
    Review.create!(
      user_id: renters.sample.id ,
      bar_id: b4.id,
      content: Faker::Restaurant.review,
      rating: rand(4..5)
    )
  end
end


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

puts "............ CREATING 6 RESERVATIONS FOR USER o1 and u1"
6.times  do
  Reservation.create!(
    date: Date.tomorrow+(rand(2..140)),
    user_id: o1.id,
    bar_id: bars.sample.id
  )
end

6.times  do
  Reservation.create!(
    date: Date.tomorrow+(rand(2..140)),
    user_id: u1.id,
    bar_id: bars.sample.id
  )
end
puts "............ SEED OK"
