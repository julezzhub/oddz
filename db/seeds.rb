require 'faker'

#puts "Deleting all users"
#User.destroy_all

puts "Creating new users"

10.times do
  User.create!(email: Faker::Internet.email, password: 'password', username: Faker::Name.first_name  + "...", avatar: "abc")
end
