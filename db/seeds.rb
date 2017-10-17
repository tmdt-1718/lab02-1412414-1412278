# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.delete_all
User.delete_all

User.create!(id: 1, firstname: 'Linh', lastname: 'Thi', phonenumber: Faker::PhoneNumber.phone_number, email: 'thiduclinh@gmail.com', password_hash: '$2a$10$bJY1NOd4/zHuuEiQaDr3L.sz1/k5DrDf5RfVUJFxYtcdRVt9Y/ZSO')
User.create!(id: 2, firstname: 'Kim', lastname: 'Vuong', phonenumber: Faker::PhoneNumber.phone_number, email: 'vuongngockim@gmail.com', password_hash: '$2a$10$bJY1NOd4/zHuuEiQaDr3L.sz1/k5DrDf5RfVUJFxYtcdRVt9Y/ZSO')
User.create!(id: 3, firstname: 'Hung', lastname: 'Banh', phonenumber: Faker::PhoneNumber.phone_number, email: 'banhvihung@gmail.com', password_hash: '$2a$10$bJY1NOd4/zHuuEiQaDr3L.sz1/k5DrDf5RfVUJFxYtcdRVt9Y/ZSO')
User.create!(id: 4, firstname: 'Nhi', lastname: 'Huynh', phonenumber: Faker::PhoneNumber.phone_number, email: 'huynhhoannhi@gmail.com', password_hash: '$2a$10$bJY1NOd4/zHuuEiQaDr3L.sz1/k5DrDf5RfVUJFxYtcdRVt9Y/ZSO')

Message.create!(id: 1, content: "Chào Kim Vuong", user_id: 1, receiver_id: 2, status: 1)
Message.create!(id: 2, content: "Chào Linh Thi", user_id: 2, receiver_id: 1, status: 1)
Message.create!(id: 3, content: "Kim Vuong khỏe không", user_id: 1, receiver_id: 1, status: 1)
Message.create!(id: 4, content: "Kim Vuong khỏe", user_id: 2, receiver_id: 1, status: 1)
Message.create!(id: 5, content: "Linh Thi khỏe không", user_id: 2, receiver_id: 1, status: 1)
Message.create!(id: 6, content: "Linh Thi khỏe", user_id: 1, receiver_id: 2, status: 0)