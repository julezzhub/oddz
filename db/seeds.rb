10.times do
  User.create(email: ("a".."z").to_a.sample + "@gmail.com", password: 'password')
end
