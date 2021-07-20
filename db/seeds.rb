# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Gift.destroy_all
Friend.destroy_all
User.destroy_all

user = User.create!( name: 'Travis', email: 'user@email.com', birthday: '2020-11-03')


friend_1 = Friend.create!( name: 'Kendall', birthday: '2021-12-11', user_id: user.id, memo: "Enjoys things")
friend_2 = Friend.create!( name: 'Melanie', birthday: '2021-11-09', user_id: user.id, memo: "Enjoys stuff")
friend_3 = Friend.create!( name: 'Rachel', birthday: '2021-08-15', user_id: user.id, memo: "Enjoys all sorts of things and stuff")
friend_4 = Friend.create!( name: 'Brisa', birthday: '2021-08-10', user_id: user.id, memo: "Likes dancing")

gift_1 = Gift.create!( name: 'Lego', description: 'building blocks', status: 1, friend_id: friend_1.id ) #won't need gift
gift_2 = Gift.create!( name: 'Blender', description: 'Vitamix', status: 0, friend_id: friend_1.id )
gift_3 = Gift.create!( name: 'Barbie', description: 'popular doll', status: 1, friend_id: friend_2.id ) # wont need gift
gift_4 = Gift.create!( name: 'Row Machine', description: 'Water Rower', status: 1, friend_id: friend_2.id )
gift_5 = Gift.create!( name: 'Transformers', description: 'Car monsters', status: 0, friend_id: friend_3.id) #Need a gift
gift_6 = Gift.create!( name: 'Book', description: 'Historical Fiction', status: 0, friend_id: friend_3.id)
gift_5 = Gift.create!( name: 'Candles', description: 'No wiccan candles please', status: 1, friend_id: friend_4.id) #Wont Need a gift
gift_5 = Gift.create!( name: 'Transformers', description: 'Car monsters', status: 0, friend_id: friend_4.id)
