# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# fetch("http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7")
#   .then(response => response.json())
#   .then((data) => {
#     console.log(data)
#   })

# Create users
puts 'destroying seeds'
Booking.destroy_all
Friend.destroy_all
User.destroy_all
puts 'seeds destroyed'

puts "create users"
10.times do
  name = Faker::Name.first_name
  User.create(
    name: name,
    password: 'password',
    email: name+'@friend.com',
  )
end

puts "create friends"
User.all.find_each do |user|
  User.all.map {
    user.friends << Friend.create!(
                                  description: Faker::Lorem.paragraph,
                                  location: Faker::Address.city,
                                  price: Faker::Number.decimal_part(digits: 2),
                                  user_id: user.id
                                )
    }
end

puts "set some friends to true"
Friend.all.find_each do |friend|
  friend.update!(is_friend: [true, false].sample)
end

puts "Create Bookings"
User.all.find_each do |user|
  2.times do |i|
    new_book = Booking.create!(
      user_id: user.id,
      friend_id: user.friends[i].id,
      comment: Faker::Lorem.paragraph,
    )
    user.bookings << new_book
    Friend.find(user.friends[i].id).bookings << new_book
  end
end

puts "seeds finish"
