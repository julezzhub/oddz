require 'action_view'
include ActionView::Helpers::NumberHelper

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
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "ivCY3Ec4iaU",  metric: "Views",  metric_count: 25000000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "KAYNE WEST - Follow God",  premade_hours: 3, premade_days: 4, thumbnail: "https://i.ytimg.com/vi/ivCY3Ec4iaU/hq720.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "kwnJTryLdp8 ",  metric: "Views",  metric_count: 300, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "LeWAGON - Promoter David",  premade_hours: 9, premade_days: 1, thumbnail: "https://i.ytimg.com/vi/kwnJTryLdp8/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "cSqi-8kAMmM",  metric: "Likes",  metric_count: 550000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "THE WITCHER - Teaser",  premade_hours: 5, premade_days: 1, thumbnail: "https://i.ytimg.com/vi/cSqi-8kAMmM/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "3fVTbbhzHIg",  metric: "Comments",  metric_count: 2400, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "AJ vs. RUIZ 2 - Highlights",  premade_hours: 2, premade_days: 2, thumbnail: "https://i.ytimg.com/vi/1EmWH2RduSk/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "nMQw29nfzpg",  metric: "Views",  metric_count: 22000000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "OMER ADAM - Tel Aviv Habibi",  premade_hours: 1, premade_days: 8, thumbnail: "https://i.ytimg.com/vi/CcWGhp667mk/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "2hmnsAIJg5I ",  metric: "Likes",  metric_count: 47000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "NINJA - Fortnite Battle",  premade_hours: 12, premade_days: 6, thumbnail: "https://i.ytimg.com/vi/2hmnsAIJg5I/hqdefault.jpg")
Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "WDUbxKGb2nY ",  metric: "Comments",  metric_count: 6000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "FORTNITE - Dev update",  premade_hours: 22, premade_days: 0, thumbnail: "https://i.ytimg.com/vi/WDUbxKGb2nY/hqdefault.jpg")

# Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "_EyZUTDAH0U",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "Travis Scott - WAKE UP",  premade_hours: 4, premade_days: 1, thumbnail: "https://i.ytimg.com/vi/yChnkXhauwM/hqdefault.jpg")
# Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "VB5HTN1y1mg",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "Lions Eating Snake (Anaconda)",  premade_hours: 2, premade_days: 2, thumbnail: "https://i.ytimg.com/vi/VB5HTN1y1mg/hqdefault.jpg")
# Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "wfN4PVaOU5Q",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "Rihanna - Needed Me",  premade_hours: 4, premade_days: 1, thumbnail: "https://i.ytimg.com/vi/wfN4PVaOU5Q/hqdefault.jpg")
# Bet.create(user: User.all.sample, friend: User.all.sample, premade: true,  target: "9G6ANKkP9cE",  metric: "Views",  metric_count: 1000, start_time: "Fri, 20 Dec 2019 00:00:00 UTC +00:00", end_time: 'Sat, 21 Dec 2019 00:00:00 UTC +00:00',  status: nil,  winner_id: nil,  video_title: "PewDiePie ROBBED!",  premade_hours: 1, premade_days: 4, thumbnail: "https://i.ytimg.com/vi/uK11Uo9R94E/hqdefault.jpg")


