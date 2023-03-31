# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

# fetch("http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7")
#   .then(response => response.json())
#   .then((data) => {
#     console.log(data)
#   })

# User.create!(name: "admin", password: 'admin123', email: 'admin@friend.com')

puts "create owners data"
owners = [
  max = { name: "max", age: 22, photo: "https://res.cloudinary.com/dbyp3pr3d/image/upload/v1677701526/development/default_user_profile.png"},
  elizableth = { name: "elizabeth", age: 25,photo: "https://res.cloudinary.com/dbyp3pr3d/image/upload/v1677701526/development/default_user_profile.png"},
  amir = { name: "amir", age: 23, photo: "https://res.cloudinary.com/dbyp3pr3d/image/upload/v1677701526/development/default_user_profile.png"},
  tom = { name: "tom", age: 23, photo: "https://res.cloudinary.com/dbyp3pr3d/image/upload/v1677701526/development/default_user_profile.png"},
  santiago = { name: "santiago", age: 20, photo: "https://res.cloudinary.com/dbyp3pr3d/image/upload/v1677766946/development/santiago.png" } 
]

owners.each do |owner|
  name = owner[:name]
  age = owner[:age]
  new_user = User.new( 
    name: name,
    password: '123456',
    email: name + '@friend.com',
    age: age
  )
  if !(owner[:photo].blank?)
    photo_url = URI.open(owner[:photo])
    new_user.user_photo.attach(io: photo_url, filename:  "#{name}.png", content_type: "image/png")
  end
  new_user.save!
end

puts "create categories"
categories = [
  "sports",
  "study",
  "workout",
  "outdoor",
  "indoor",
  "Sing"
]

puts "create activities data"

5.times do |i|
  current_user = User.find(i + 1)
  photo = URI.open(Faker::Avatar.image)
  activity = Activity.new(
    description: Faker::Lorem.paragraph, 
    location: Faker::Address.city, 
    price: Faker::Number.decimal_part(digits: 2),
    category: categories.sample
  )
  # activity.photo.attach(io: photo, filename:  (current_user.name) +".png", content_type: "image/png")
  activity.user = current_user
  activity.save!
end

puts "set some friends to true"
Activity.all.find_each do |activity|
  activity.update!(is_friend: [true, false].sample)
end

puts "seeds finish"
