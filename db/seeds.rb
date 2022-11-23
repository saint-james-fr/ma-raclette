# Data Reinitialization - Don't change the order :)
Booking.destroy_all
Raclette.destroy_all
User.destroy_all

# User Options & Seed
user_admin_options = {
  first_name: "admin_first_name",
  last_name: "admin_name",
  password: "admin1234",
  avatar: "https://picsum.photos/200",
  password_confirmation: "admin1234",
  description: "hey, i'm the admin",
  email: "admin@ma-raclette.com",
}

puts ">"
puts "starts creating user"
User.create!(user_admin_options)
puts ">"
puts "done!"

# Raclette Options & Seed
raclette_options = {
  location: "chez Anne",
  user_id: User.last.id,
  title: "Anne's Famous Raclette",
  description: "Il paraît qu'il y aura 1,5kg de fromage... et de la salade!",
  number_of_guests: 6,
  photo: "https://images.unsplash.com/photo-1635924210828-ccbe493b6e1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
}
puts ">"
puts "starts creating raclette"
Raclette.create!(raclette_options)
puts ">"
puts "done!"

# Booking Options & Seed
puts "starts creating booking"
booking_options = {
  date: DateTime.strptime("11/23/2022 20:00", "%m/%d/%Y %H:%M"),
  description: "c'est chez Anne ça va être super",
  raclette_id: Raclette.last.id,
  user_id: User.last.id,
}
Booking.create!(booking_options)
puts ">"
puts "done!"
puts ">"
puts "Congrats you've done beautiful seed!"
