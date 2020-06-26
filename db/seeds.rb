# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

post_titles = ['Newsletter', 'Post', 'Announcement']

3.times do
  Post.create!(
    title: Faker::Lorem.word,
    body: Faker::Lorem.words(number: 4),
    published_at: Faker::Date.between(from: '2014-04-10', to: '2014-09-25')
  )
end

5.times do
  Author.create!(
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name
  )
end

20.times do
  Comment.create!(
    body: Faker::Lorem.words(number: 4),
    author_id: rand(1..Author.count),
    post_id: rand(1..Post.count),
    removed: Faker::Boolean.boolean
  )
end
