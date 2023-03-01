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

User.create!(name: "admin", password: 'admin123', email: 'admin@friend.com')

puts "create owners data"
owners = ["max", "elizableth", "amir", "tom", "santiago"]
owners.each do |owner_name|
  name = owner_name
  User.create( 
    name: name,
    password: '123456',
    email: name + '@friend.com',
  )
end

puts "create users"
1.times do
  name = Faker::Name.first_name
  User.create(
    name: name,
    password: 'password',
    email: name + '@friend.com',
  )
end

puts "create friends data"
new_friends = Array.new

5.times do
  first_name = Faker::Name.first_name 
  new_friend = {
    name: first_name,
    age:  Faker::Number.between(from: 18, to: 80),
    email: first_name + '@friend.com',
    description: Faker::Lorem.paragraph, 
    location: Faker::Address.city, 
    price: Faker::Number.decimal_part(digits: 2), 
    photo_url: Faker::Avatar.image
  }
  new_friends << new_friend
end

puts "create friends instances"
User.all.find_each do |user|
  new_friends.each do |friend|
    puts "createn friend"
    photo = URI.open(friend[:photo_url])
    friend = Friend.new(
      name: friend[:name],
      age: friend[:age],
      email: friend[:email],
      description: friend[:description], 
      location: friend[:location], 
      price: friend[:price], 
      user_id: user.id
    )
    friend.photo.attach(io: photo, filename: friend[:name]+".png", content_type: "image/png")
    new_friend = friend.save!
    # user.friends << new_friend
  end
end

puts "set some friends to true"
Friend.all.find_each do |friend|
  friend.update!(is_friend: [true, false].sample)
end

# puts "Create Bookings"
# User.all.find_each do |user|
#   2.times do |i|
#     new_book = Booking.create!(
#       user_id: user.id,
#       friend_id: user.friends[i].id,
#       comment: Faker::Lorem.paragraph,
#     )
#     user.bookings << new_book
#     Friend.find(user.friends[i].id).bookings << new_book
#   end
# end

puts "seeds finish"
