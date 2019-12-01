10.times do
  User.create(email: ("a".."z").to_a.sample + "@gmail.com", password: 'password')
end

Friendship.create({
  friended: User.find(5),
  user: User.find(6)
})
Friendship.create({
  friended: User.find(5),
  user: User.find(4)
})
Friendship.create({
  friended: User.find(3),
  user: User.find(5)
})
Friendship.create({
  friended: User.find(9),
  user: User.find(5)
})
