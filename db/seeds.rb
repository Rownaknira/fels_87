# Users
User.create!(name:  "Example User",
             email: "example@test.com",
             password:              "password",
             password_confirmation: "password",
             admin:	true)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@test.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Following	relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
