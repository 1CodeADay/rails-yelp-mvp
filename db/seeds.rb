# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
categories = %w[chinese italian japanese french belgian]

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants...'
10.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: categories.sample
  )
puts "created restarant > #{restaurant.name}"
end

puts 'Creating reviews...'
10.times do
  review = Review.create!(content: Faker::Quotes::Shakespeare.hamlet_quote,
    rating: rand(1..5), restaurant_id: Restaurant.all.sample.id
  )
puts "created review > #{review.content}"
end

puts "Finished!"
