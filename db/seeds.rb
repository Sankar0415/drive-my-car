# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
require 'faker'
User.destroy_all
Car.destroy_all
Rental.destroy_all

20.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
              email: Faker::Internet.email, password: 'test123')
end

20.times do
  Car.create(brand: Faker::Vehicle.manufacture, model: Faker::Vehicle.model, price: rand(50..100),
             user: User.all.sample)
end

50.times do
  # Random date in current year
  date = Faker::Date.in_date_period
  user = User.all.sample
  # we are filtering out the cars that belong to an individual user
  our_car = Car.all.reject { |car| car.user === user }.sample
  Rental.create(rental_begin: date, rental_end: date + rand(1..10), user: user, car: our_car)
end
