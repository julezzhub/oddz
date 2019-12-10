require 'faker'

puts "Deleting all users"
Bet.destroy_all
Transaction.destroy_all
Notification.destroy_all
User.destroy_all


puts "Creating new users"

10.times do
  User.create!(email: Faker::Internet.email, password: 'password', username: Faker::Name.first_name, remote_avatar_url: "https://source.unsplash.com/collection/566311/#{rand(1..268)}")
end

puts "Creating bets"
 3.times do
	Bet.create(user: User.all.sample, friend: User.all.sample, target: 'video', metric: 'Views', metric_count: rand(100000)*10, start_time: Time.now - rand(10..1000)*100, end_time: Time.now + rand(10..1000)*10, stake: rand(1..5))
end

puts "Creating premade bets"

Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "uelHwf8o7_U",  metric: "likes",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "Adele - Hello",  premade_hours: 1, premade_days: 2, thumbnail: "https://i.ytimg.com/vi/YQHsXMglC9A/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "_EyZUTDAH0U",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "Travis Scott - WAKE UP",  premade_hours: 4, premade_days: 1, thumbnail: "https://i.ytimg.com/vi/yChnkXhauwM/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "2hmnsAIJg5I ",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "NINJA | True Geordie Podcast",  premade_hours: 3, premade_days: 1, thumbnail: "https://i.ytimg.com/vi/2hmnsAIJg5I/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "VB5HTN1y1mg",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "Lions Eating Snake (Anaconda)",  premade_hours: 2, premade_days: 2, thumbnail: "https://i.ytimg.com/vi/VB5HTN1y1mg/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "wfN4PVaOU5Q",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "Rihanna - Needed Me",  premade_hours: 4, premade_days: 1, thumbnail: "https://i.ytimg.com/vi/wfN4PVaOU5Q/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "9G6ANKkP9cE",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "PewDiePie ROBBED! #DramaAlert Alinity did it AGAIN!",  premade_hours: 1, premade_days: 4, thumbnail: "https://i.ytimg.com/vi/uK11Uo9R94E/hqdefault.jpg")
