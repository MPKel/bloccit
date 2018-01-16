require 'random_data'

#create posts
# uniqPost = Post.find_or_create_by!(title: 'McSweeny', body: "Hi I'm McSweeny and this is my first post!")
# uniqComment = Comment.find_or_create_by!(body: "go away McSweeny!", post: uniqPost)


5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all


15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  post = Post.create!(
    user:   users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 # #13
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all

12.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: RandomData.random_number
  )
end
sponsored_posts = SponsoredPost.all

100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

10.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
end

# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'grenfro4000@yahoo.com',
  password: 'password123',
  role:     'admin'
)

moderator = User.create!(
  name:     'Mod',
  email:    'fake123@e.com',
  password: 'password123',
  role:     'moderator'

)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "#{Vote.count} votes created"
