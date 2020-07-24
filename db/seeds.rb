# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#u1 = User.find_by(id:1)
#u1.comments
#u1.favorites

#u2 = User.find_by(id:2)
#u2.comments
#u2.favorites
#u2.list = List.find

#c1 = Company.find_by(id:1)
#c1.comments
#c1.favorites/followers
#c1.users #is the favorites/followers

#c2 = Company.find_by(id:2)
#c2.comments
#c2.favorites


c1 = Company.create(title: "First Company", description: "This is the first company")
c2 = Company.create(title: "Second Company", description: "This is the Second company")
c3 = Company.create(title: "Third Company", description: "This is the Third company")
u1 = User.create(username: "britt", email: "britt@gmail.com", password: "password")
# u1.save
u1.comments.create(:content => "This is a first comment for user britt", :company_id => 1)
u1.comments.create(:content => "This is a comment 2 for user britt", :company_id => 2)
# u1.favorites.create(:company_id => 2).save
#u1.favorites.find(1).update(liked: false)
#.save(validate: false)
u1.lists.create(:name => "B's List")
u1.lists.create(:name => "B's List 2")

u2 = User.create(username: "a", email: "a@gmail.com", password: "password")
# u2.save
u2.comments.create(:content => "This is a comment the first comment for user A", :company_id => 2)
u2.comments.create(:content => "This is a comment 2 comment for user A", :company_id => 2)
u2.comments.create(:content => "This is a comment 3 comment for user A", :company_id => 3)
# u2.favorites.create(:company_id => 1)
#u1.favorites.find(1).update(liked: false)
#.save(validate: false)
u2.lists.create(:name => "A's List")
u2.lists.create(:name => "A's Second List")
u2.save

u3 = User.create(username: "c", email: "c@gmail.com", password: "password")
# u3.save
u3.comments.create(:content => "This is a comment the first comment for user C", :company_id => 1)
u3.comments.create(:content => "This is a comment 2 comment for user C", :company_id => 2)
u3.comments.create(:content => "This is a comment 3 comment for user C", :company_id => 3)
# u3.favorites.create(:company_id => 1)
# u3.favorites.create(:company_id => 2)
# u3.favorites.create(:company_id => 3)
# #u1.favorites.find(1).update(liked: false)
# #.save(validate: false)
u3.lists.create(:name => "C's List")
u3.lists.create(:name => "C's Second List")



# 5.times do |t|
#     title = Faker::Company.bs
#     description = Faker::Lorem.paragraph(sentence_count: 1, supplemental: true) 
#     Company.create(title: title, description: description)
# end

# 5.times do |t|
#     username = Faker::Name.name 
#     email = Faker::Internet.email
#     User.create(username: username, email: email)
# end

# a = Favorite.create(user_id: 2, company_id: 2)
# b = Favorite.create(user_id: 4, company_id: 3)
# c = Favorite.create(user_id: 3, company_id: 4)

# content1 = Faker::Lorem.paragraph(sentence_count: 3, supplemental: true)
# content2 = Faker::Lorem.paragraph(sentence_count: 3, supplemental: true)
# content3 = Faker::Lorem.paragraph(sentence_count: 3, supplemental: true)
# d = Comment.create(content: content1, user_id: 4, company_id: 2)
# e = Comment.create(content: content2, user_id: 3, company_id: 3)
# f = Comment.create(content: content3, user_id: 4, company_id: 3)


# 2.times do |t|
#     content = Faker::Lorem.paragraph(sentence_count: 3, supplemental: true)
#     Comment.create(content: content, user_id: 1, company_id: 2)
# end
