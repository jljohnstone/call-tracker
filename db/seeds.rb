# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: "Jason", last_name: "Robertson", email: "jason@example.com")
User.create(first_name: "Joel", last_name: "Miller", email: "joel@example.com")
User.create(first_name: "Makayla", last_name: "Hill", email: "makayla@example.com")

10.times do
  timestamp = DateTime.now - (rand * 21)
  FactoryBot.create(:note, user: User.all.sample, created_at: timestamp, updated_at: timestamp)
end
