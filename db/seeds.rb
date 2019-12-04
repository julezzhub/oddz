require 'faker'

puts "Deleting all users"
Bet.destroy_all
User.destroy_all

puts "Creating new users"

10.times do
  User.create!(email: Faker::Internet.email, password: 'password', username: Faker::Name.first_name  + "...", remote_avatar_url: "https://source.unsplash.com/collection/566311/#{rand(1..268)}")
end

=beginputs "Creating bets"
 3.times do
	Bet.create(user: User.all.sample, friend: User.all.sample, target: 'video', metric: 'views', metric_count: rand(100000)*10, start_time: Time.now - rand(10..1000)*100, end_time: Time.now + rand(10..1000)*10, stake: rand(1..5))
end=end
