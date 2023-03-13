# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "admin@example.com", password: "adminpass", first_name: "Admin", last_name: "User", time_zone: "UTC", assignable: false) if User.none?
# 3.times do
#   FactoryBot.create(:user, assignable: true)
# end
# 5.times do
#   FactoryBot.create(:customer)
# end
# assignable_users = User.where(assignable: true)
# 10.times do
#   FactoryBot.create(:note, customer: Customer.all.sample, assigned_to_user: assignable_users.sample, created_by_user: User.all.sample)
# end
