# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# start_category

Category.create!(name:  "Laptop",
                parent_id: 0)
Category.create!(name:  "Other",
                parent_id: 0)
Category.create!(name:  "Dell",
                parent_id: 1)
Category.create!(name:  "Assus",
                parent_id: 1)
Category.create!(name:  "HP",
                parent_id: 1)
Category.create!(name:  "Acer",
                parent_id: 1)
Category.create!(name:  "Macbook",
                parent_id: 1)
Category.create!(name:  "Speakers",
                parent_id: 2)
Category.create!(name:  "balo",
                parent_id: 2)
# 3.times do |n|
#   name  = "Dell#{n}"
#   Category.create!(name:  name,
#                 parent_id: 4)
# end
# 3.times do |n|
#   name  = "Assus#{n}"
#   Category.create!(name:  name,
#                 parent_id: 5)
# end
# 3.times do |n|
#   name  = "Lenovo#{n}"
#   Category.create!(name:  name,
#                 parent_id: 6)
# end
# 3.times do |n|
#   name  = "Samsung#{n}"
#   Category.create!(name:  name,
#                 parent_id: 7)
# end
# 3.times do |n|
#   name  = "Iphone#{n}"
#   Category.create!(name:  name,
#                 parent_id: 8)
# end
# 3.times do |n|
#   name  = "HTC#{n}"
#   Category.create!(name:  name,
#                 parent_id: 9)
# end

# 5.times do |n|
#   name  = Faker::Name.name
#   Category.create!(name:  name,
#                 parent_id: 3)
# end

# 5.times do |n|
#   name  = Faker::Name.name
#   Category.create!(name:  name,
#                 parent_id: rand(3..8))
# end

# start Product

# Product_other

2.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Product.create!(name:  "speaker bluetooth #{n}",
               price: rand(10000000..30000000),
               quantity: rand(5..20),
               description: content,
               picture: "default1.jpg",
               category_id: 8)
end

1.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Product.create!(name:  "balo #{n}",
               price: rand(10000000..30000000),
               quantity: rand(5..20),
               description: content,
               picture: "default1.jpg",
               category_id: 9)
end

3.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Product.create!(name:  "Dell #{n}",
               price: rand(10000000..30000000),
               quantity: rand(5..20),
               description: content,
               picture: "default1.jpg",
               category_id: 3)
end

3.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Product.create!(name:  "Assus #{n}",
               price: rand(10000000..30000000),
               quantity: rand(5..20),
               description: content,
               picture: "default1.jpg",
               category_id: 4)
end

3.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Product.create!(name:  "Hp #{n}",
               price: rand(10000000..30000000),
               quantity: rand(5..20),
               description: content,
               picture: "default1.jpg",
               category_id: 5)
end

3.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Product.create!(name:  "Acer #{n}",
               price: rand(10000000..30000000),
               quantity: rand(5..20),
               description: content,
               picture: "default1.jpg",
               category_id: 6)
end

3.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Product.create!(name:  "Macbook #{n}",
               price: rand(10000000..30000000),
               quantity: rand(5..20),
               description: content,
               picture: "default1.jpg",
               category_id: 7)
end


# end_product


5.times do |n|
  Image.create!(photo: "default.jpg",
               product_id: 1)
end

5.times do |n|
  Image.create!(photo: "default.jpg",
               product_id: 2)
end

5.times do |n|
  Image.create!(photo: "default.jpg",
               product_id: 3)
end

5.times do |n|
  Image.create!(photo: "default1.jpg",
               product_id: 4)
end

5.times do |n|
  Image.create!(photo: "default1.jpg",
               product_id: 5)
end

5.times do |n|
  Image.create!(photo: "default1.jpg",
               product_id: 6)
end

5.times do |n|
  Image.create!(photo: "default3.jpg",
               product_id: 7)
end

5.times do |n|
  Image.create!(photo: "default3.jpg",
               product_id: 8)
end

5.times do |n|
  Image.create!(photo: "default3.jpg",
               product_id: 9)
end

5.times do |n|
  Image.create!(photo: "default2.jpg",
               product_id: 10)
end

5.times do |n|
  Image.create!(photo: "default2.jpg",
               product_id: 11)
end

5.times do |n|
  Image.create!(photo: "default2.jpg",
               product_id: 12)
end

5.times do |n|
  Image.create!(photo: "default4.jpg",
               product_id: 13)
end

5.times do |n|
  Image.create!(photo: "default4.jpg",
               product_id: 14)
end

5.times do |n|
  Image.create!(photo: "default4.jpg",
               product_id: 15)
end

5.times do |n|
  Image.create!(photo: "default5.jpg",
               product_id: 16)
end

5.times do |n|
  Image.create!(photo: "default5.jpg",
               product_id: 17)
end
5.times do |n|
  Image.create!(photo: "default5.jpg",
               product_id: 18)
end


# 5.times do |n|
#   name  = Faker::Name.name
#   content = Faker::Lorem.sentence(5)
#   Product.create!(name:  "Assus #{n}",
#                price: rand(10000000..30000000),
#                quantity: rand(5..20),
#                description: content,
#                picture: "default3.jpg",
#                category_id: 4)
# end
# 5.times do |n|
#   name  = Faker::Name.name
#   content = Faker::Lorem.sentence(5)
#   Product.create!(name:  "Hp #{n}",
#                price: rand(10000000..30000000),
#                quantity: rand(5..20),
#                description: content,
#                picture: "default2.jpg",
#                category_id: 5)
# end
# 5.times do |n|
#   name  = Faker::Name.name
#   content = Faker::Lorem.sentence(5)
#   Product.create!(name:  "Acer #{n}",
#                price: rand(10000000..30000000),
#                quantity: rand(5..20),
#                description: content,
#                picture: "default4.jpg",
#                category_id: 6)
# end
# 5.times do |n|
#   name  = Faker::Name.name
#   content = Faker::Lorem.sentence(5)
#   Product.create!(name:  "Macbook #{n}",
#                price: rand(10000000..30000000),
#                quantity: rand(5..20),
#                description: content,
#                picture: "default5.jpg",
#                category_id: 7)
# end

# user

User.create!(name:  "phuoctuyen",
             email: "haphuoctuyen1997@gmail.com",
             password: "123456789",
             password_confirmation: "123456789",
             address: "điện phước ,điện bàn , quảng nam",
             phone: "01219399936"
             )

User.create!(name:  "admin",
             email: "admin@gmail.com",
             password: "123456789",
             password_confirmation: "123456789",
             role: 1,
             address: "Da Nang",
             phone: "0989323212"
             )

User.create!(name:  "userhome",
             email: "user@gmail.com",
             password: "123456789",
             password_confirmation: "123456789",
             role: 1,
             address: "quang nam",
             phone: "01667272741"
             )

# 10.times do |n|
#   name  = Faker::Name.name
#   email = "example_#{n}@gmail.com"
#   password = "123456789"
#   content = Faker::Lorem.sentence(5)
#   User.create!(name:  name,
#                email: email,
#                password: 123456789,
#                password_confirmation: 123456789,
#                role: 0,
#                address: content,
#                phone: "01667272741")
# end

# p "Created #{User.count} users"

# 10.times do |n|
#   name  = Faker::Name.name
#   content = Faker::Lorem.sentence(5)
#   Order.create!(user_id: rand(1..3),
#                receiver_name:  name,
#                receiver_address: content,
#                receiver_phone: "01667272741",
#                total_price: rand(100..10000))

# end

# 10.times do |n|
#   OrderItem.create!(order_id: rand(1..10),
#                    product_id:  rand(1..10),
#                    price: rand(50..1000),
#                    quantity: rand(1..5))

# end

# 10.times do |n|
#   Comment.create!(content: "san pham tot",
#                   user_id: rand(1..3),
#                   product_id: rand(1..10))

# end

# # # Category.create!(name:  "cccccccccccc",
# # #              parent_id: 1
# # #              )
# # p "Created #{Category.count} categoriess"

# Suggest.create!(name:  "San pham moi",
#              description: "San pham hot",
#              status: 1,
#              user_id: 1,
#              category_id: 10
#              )
# p "Created #{Suggest.count} suggets"
