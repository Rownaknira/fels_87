# Admin User
User.create!(name:  "Example User",
             email: "example@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)
# Normal user
User.create name: "test",
           email: "test@example.com",
           password: "password",
           password_confirmation: "password"

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@test.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# Categories
10.times do |i|
  Category.create name: "category #{i+1}"
end

# Generate words
cat_1 = Category.first
cat_2 = Category.find 2

1.upto(100) do |i|
  word = Word.create content: "word #{i}"
  cat_1.words << word
end

101.upto(200) do |i|
  word = Word.create content: "word #{i}"
  cat_2.words << word
end

# Generate word answers
words = Word.all
words.each do |word|
  4.times do |i|
    answer = Answer.create content: "english #{(word.id-1)*4 + (i+1)}", word_id: word.id
    answer.update_attribute :correct, true if i == 0
  end
end
