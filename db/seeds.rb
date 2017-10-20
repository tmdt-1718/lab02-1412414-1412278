# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.delete_all
Friend.delete_all
User.delete_all

User.create!(id: 1, first_name: 'Linh', last_name: 'Thi', phone_number: Faker::PhoneNumber.phone_number, email: 'thiduclinh@gmail.com', password_digest: '$2a$10$bJY1NOd4/zHuuEiQaDr3L.sz1/k5DrDf5RfVUJFxYtcdRVt9Y/ZSO')
User.create!(id: 2, first_name: 'Kim', last_name: 'Vuong', phone_number: Faker::PhoneNumber.phone_number, email: 'vuongngockim@gmail.com', password_digest: '$2a$10$bJY1NOd4/zHuuEiQaDr3L.sz1/k5DrDf5RfVUJFxYtcdRVt9Y/ZSO')
User.create!(id: 3, first_name: 'Hung', last_name: 'Banh', phone_number: Faker::PhoneNumber.phone_number, email: 'banhvihung@gmail.com', password_digest: '$2a$10$bJY1NOd4/zHuuEiQaDr3L.sz1/k5DrDf5RfVUJFxYtcdRVt9Y/ZSO')
User.create!(id: 4, first_name: 'Nhi', last_name: 'Huynh', phone_number: Faker::PhoneNumber.phone_number, email: 'huynhhoannhi@gmail.com', password_digest: '$2a$10$bJY1NOd4/zHuuEiQaDr3L.sz1/k5DrDf5RfVUJFxYtcdRVt9Y/ZSO')

Friend.create!(friend_id: 1, user_id: 2)
Friend.create!(friend_id: 2, user_id: 1)
Friend.create!(friend_id: 1, user_id: 4)
Friend.create!(friend_id: 4, user_id: 1)

Message.create!(id: 1, content: "Hi Kim Vuong", user_id: 1, receiver_id: 2, status: 1, created_at: "2017-10-17 12:45:30", updated_at: "2017-10-17 12:45:30")
Message.create!(id: 2, content: "Hi Linh Thi", user_id: 2, receiver_id: 1, status: 1, created_at: "2017-10-17 12:45:35", updated_at: "2017-10-17 12:45:35")
Message.create!(id: 3, content: "How are you doing?", user_id: 1, receiver_id: 2, status: 1, created_at: "2017-10-17 12:45:40", updated_at: "2017-10-17 12:45:40")
Message.create!(id: 4, content: "Good", user_id: 2, receiver_id: 1, status: 1, created_at: "2017-10-17 12:45:45", updated_at: "2017-10-17 12:45:45")
Message.create!(id: 5, content: "How about you?", user_id: 2, receiver_id: 1, status: 1, created_at: "2017-10-17 12:45:50", updated_at: "2017-10-17 12:45:50")
Message.create!(id: 6, content: "I'm great", user_id: 1, receiver_id: 2, status: 1, created_at: "2017-10-17 12:45:55", updated_at: "2017-10-17 12:45:55")
Message.create!(id: 7, content: "I'm going to Canada this weekend, do you want to go with me?", user_id: 1, receiver_id: 2, status: 1, created_at: "2017-10-17 12:46:30", updated_at: "2017-10-17 12:46:30")
Message.create!(id: 8, content: "It's greate, but I'm sorry I can't", user_id: 2, receiver_id: 1, status: 1, created_at: "2017-10-17 12:47:30", updated_at: "2017-10-17 12:47:30")
Message.create!(id: 9, content: "Why?", user_id: 1, receiver_id: 2, status: 1, created_at: "2017-10-17 12:47:40", updated_at: "2017-10-17 12:47:40")
Message.create!(id: 10, content: "Because I don't have enough money", user_id: 2, receiver_id: 1, status: 1, created_at: "2017-10-17 12:48:30", updated_at: "2017-10-17 12:48:30")
Message.create!(id: 11, content: "Don't worry about that. I'll give you money to go", user_id: 1, receiver_id: 2, status: 1, created_at: "2017-10-17 12:48:50", updated_at: "2017-10-17 12:48:50")
Message.create!(id: 12, content: "Really? I'm really glad, but I don't want to use your money", user_id: 2, receiver_id: 1, status: 1, created_at: "2017-10-17 12:49:30", updated_at: "2017-10-17 12:49:30")
Message.create!(id: 13, content: "Oh, come on, we are best friends. Please, go with me!!", user_id: 1, receiver_id: 2, status: 1, created_at: "2017-10-17 12:50:30", updated_at: "2017-10-17 12:50:30")
Message.create!(id: 14, content: "Ok, I'll go with you to Canada", user_id: 2, receiver_id: 1, status: 1, created_at: "2017-10-17 12:51:30", updated_at: "2017-10-17 12:51:30")
Message.create!(id: 15, content: "Yeah!!!", user_id: 1, receiver_id: 2, status: 0, created_at: "2017-10-17 12:52:30", updated_at: "2017-10-17 12:52:30")

Message.create!(id: 16, content: "Are you free tomorrow?", user_id: 4, receiver_id: 2, status: 0, created_at: "2017-10-18 12:45:30", updated_at: "2017-10-18 12:45:30")
Message.create!(id: 17, content: "I want to go shopping and buy some clothes for the upcoming party. Do you want to go with me?", user_id: 4, receiver_id: 2, status: 0, created_at: "2017-10-18 12:46:30", updated_at: "2017-10-18 12:46:30")
Message.create!(id: 18, content: "Hey, why don't you reply to me?", user_id: 4, receiver_id: 2, status: 0, created_at: "2017-10-18 12:50:30", updated_at: "2017-10-18 12:50:30")
Message.create!(id: 19, content: "Hey hey", user_id: 4, receiver_id: 2, status: 0, created_at: "2017-10-18 12:59:30", updated_at: "2017-10-18 12:59:30")