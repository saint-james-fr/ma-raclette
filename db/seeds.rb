require "open-uri"
# Data Reinitialization - Don't change the order :)
Review.destroy_all
Booking.destroy_all
Raclette.destroy_all
User.destroy_all

# User Options & Seed
user1 = {
  first_name: "Anne",
  last_name: "Ly",
  password: "annely",
  password_confirmation: "annely",
  description: "hey, my name is Anne and I love raclettes",
  email: "anne@ma-raclette.com",
}
user2 = {
  first_name: "Pierre",
  last_name: "Petel",
  password: "pierrepetel",
  password_confirmation: "pierrepetel",
  description: "hey, i'm Pierre, I love to steal keys and of course, I love cheese!",
  email: "pierre@ma-raclette.com",
}
user3 = {
  first_name: "Maxence",
  last_name: "Robinet",
  password: "maxencerobinet",
  password_confirmation: "maxencerobinet",
  description: "hey, i'm Maxence, I can eat raclettes on every seasons and I'm also a codeur fou",
  email: "maxence@ma-raclette.com",
}

user4 = {
  first_name: "Benjamin",
  last_name: "Doberset",
  password: "benjamindoberset",
  password_confirmation: "benjamindoberset",
  description: "hey, i'm Benjamin, I can batch cook some raclettes for my lunch at work!",
  email: "benjamin@ma-raclette.com",
}

user5 = {
  first_name: "Gaspard",
  last_name: "Fauchille",
  password: "gaspardfauchille",
  password_confirmation: "gaspardfauchille",
  description: "hey, i'm Gaspard and I put some maroille on my raclette",
  email: "gaspard@ma-raclette.com",
}

users_options = [user1, user2, user3, user4, user5]

puts ">"
puts "starts creating users"
users_options.each do |user_option|
  file = URI.open("https://picsum.photos/200?person")
  user = User.new(user_option)
  user.avatar.attach(io: file, filename: "nes#{rand(1..1000000)}.png", content_type: "image/png")
  user.save
end
puts ">"
puts "done!"

# Raclette Options & Seed
raclette_1 = {
  location: "23 rue Coysevox, 75018 Paris",
  user_id: User.first.id,
  title: "Anne's Famous Raclette",
  description: "Il paraît qu'il y aura 1,5kg de fromage... et de la salade!",
  number_of_guests: 6
}

raclette_2 = {
  location: "2 boulevard Biron, 93400 Saint-Ouen",
  user_id: User.all[1].id,
  title: "Raclette de banlieue",
  description: "Une raclette simple pour les gens simples",
  number_of_guests: 3
}

raclette_3 = {
  location: "Puteaux",
  user_id: User.all[2].id,
  title: "Raclette de gros déglingooooos",
  description: "Au moins 15 kg de fromage prévu",
  number_of_guests: 2
}
raclette_4 = {
  location: "2 rue de la sablière, 75014 Paris",
  user_id: User.all[3].id,
  title: "Raclette à la bonne franquette",
  description: "Une raclette simple pour les gens simples",
  number_of_guests: 4
}
raclette_5 = {
  location: "33 boulevard Barbès, 75018 Paris",
  user_id: User.all[4].id,
  title: "Raclette chic, détail choc",
  description: "Une raclette chic pour les gens sophistiqués",
  number_of_guests: 7
}

raclette_options = [raclette_1, raclette_2, raclette_3, raclette_4, raclette_5]

puts ">"
puts "starts creating raclettes"
raclette_options.each do |raclette_option|
  file = URI.open("https://media.istockphoto.com/id/864457504/fr/photo/fromage-%C3%A0-raclette-fondu.jpg?s=612x612&w=0&k=20&c=dG6qmUzpuJcPG2bwnrRbYlC22O6snd9BcHxlCzenV0o=")
  raclette = Raclette.new(raclette_option)
  raclette.photo.attach(io: file, filename: "nes#{rand(1..1000000)}.png", content_type: "image/png")
  raclette.save
end
puts ">"
puts "done!"

# Booking Options & Seed
puts "starts creating booking"
booking_options = {
  date: DateTime.strptime("11/23/2022 20:00", "%m/%d/%Y %H:%M"),
  description: "c'est chez Anne ça va être super",
  big_eater: 1,
  normal_eater: 1,
  small_eater: 1,
  raclette_id: Raclette.all[0].id,
  user_id: User.all[0].id
}

Booking.create!(booking_options)
puts ">"
puts "done!"
puts ">"
puts "Congrats you've done beautiful seed!"
