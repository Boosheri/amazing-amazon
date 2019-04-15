# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
Review.delete_all
User.delete_all

1000.times do
  created_at = Faker::Date.backward(365 * 5)
  p = Product.create(
    # Faker is ruby module. We are just accessing
    # the class Hacker inside the module Faker
    title: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    price: Faker::Number.within(1..100),
    created_at: created_at,
    updated_at: created_at
  )
  if p.valid?
    p.reviews = rand(0..15).times.map do
      Review.new(rating: rand(1..5), body: Faker::Coffee.intensifier, user: users.sample)
    end
  end
end

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

user = User.all
product = Product.all
review = Review.all

puts Cowsay.say("Generated #{ product.count } products", :cow)
puts Cowsay.say("Generated #{ review.count } products", :cow)
puts Cowsay.say("Generated #{ user.count } products", :cow)
