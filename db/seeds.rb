require 'faker'

puts "Deleting all users"
Bet.destroy_all
User.destroy_all

puts "Creating new users"

10.times do
  User.create!(email: Faker::Internet.email, password: 'password', username: Faker::Name.first_name  + "...", remote_avatar_url: "https://source.unsplash.com/collection/566311/#{rand(1..268)}")
end

puts "Creating bets"
 3.times do
	Bet.create(user: User.all.sample, friend: User.all.sample, target: 'video', metric: 'views', metric_count: rand(100000)*10, start_time: Time.now - rand(10..1000)*100, end_time: Time.now + rand(10..1000)*10, stake: rand(1..5))
end

puts "Creating premade bets"
6.times do
  Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "uelHwf8o7_U",  metric: "likes",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "Adele - Hello from the other side",  premade_hours: 1, premade_days: 2)
end
