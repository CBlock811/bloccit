require 'faker'

topics = []
15.times do
  topics << Topic.create(
    name: Faker::Lorem.sentence, 
    description: Faker::Lorem.paragraph
  )
end


5.times do
  password = Faker::Lorem.characters(10)
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  user.skip_confirmation!
  user.save

  5.times do
    topic = topics.first
    post = Post.create(
      user: user,
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph)
    post.update_attribute(:created_at, Time.now - rand(600..315360000))
  end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

# Create an admin user
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
admin.skip_confirmation!
admin.save
admin.update_attribute(:role, 'admin')

# Create a moderator
moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
moderator.skip_confirmation!
moderator.save
moderator.update_attribute(:role, 'moderator')

# Create a member
member = User.new(
  name: 'Member User',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
member.skip_confirmation!
member.save

