# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
user = User.create!( name: 'Dione Travis', email: 'user@email.com', birthday: '2020-11-03')


friend_1 = Friend.create!( name: 'Kendall', birthday: '2020-12-11')
friend_2 = Friend.create!( name: 'Melanie', birthday: '2020-11-09')
friend_3 = Friend.create!( name: 'Rachel', birthday: '2020-07-08')

gift_1 = Gift.create!( name: 'Lego', description: 'building blocks', status: 1, friend_id: 1 )
gift_2 = Gift.create!( name: 'Monopoly', description: 'capitalisnm 101', status: 0, friend_id: 1 )
gift_3 = Gift.create!( name: 'Barbie', description: 'popular doll', status: 1, friend_id: 1 )
gift_4 = Gift.create!( name: 'My Little Pony', description: 'cute ponies with tattoo', status: 1, friend_id: 2 )
gift_5 = Gift.create!( name: 'Transformers', description: 'Car monsters', status: 0, friend_id: 3)
