# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Destroy all Restaurant'
Restaurant.destroy_all
puts 'Create Restaurants'
resto1 = Restaurant.create!(name: "MAC", address: "Toulouse", phone_number: "05 00 00 00 01", category: "french")
resto2 = Restaurant.create!(name: "Pizza Mama", address: "Toulouse", phone_number: "05 00 00 00 02", category: "italian")
resto3 = Restaurant.create!(name: "Jiao Zi Guan", address: "Toulouse", phone_number: "05 00 00 00 03", category: "chinese")
review1 = Review.create!(rating: "5", content: "Tres bon camion de burgers", restaurant_id: resto1.id)
review2 = Review.create!(rating: "5", content: "Buena pizza", restaurant_id: resto2.id)
review3 = Review.create!(rating: "5", content: "Tres bon raviolis", restaurant_id: resto3.id)
puts 'End'
