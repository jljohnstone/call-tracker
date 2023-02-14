# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot_rails'

500.times do
  FactoryBot.create(:customer)
end

User.create(name: "Jason Robertson", email: "jason@example.com")
User.create(name: "Joel Miller", email: "joel@example.com")
User.create(name: "Ashley Smith", email: "ashley@example.com")
User.create(name: "Makayla Hill", email: "makayla@example.com")
