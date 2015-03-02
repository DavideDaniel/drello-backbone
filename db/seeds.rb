# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

provider1 = Provider.create(
  name: "Sharon Chu",
  password: "123",
  email: "sharon@gmail.com",
trelloName: "daviddaniel6")

consumer1 = Consumer.create(
  name: "Jason Ng",
  password: "123",
  email: "jason@gmail.com",
  provider_id: 1,
  birthday: 1981/20/10,
gender: 'male')

consumer2 = Consumer.create(
  name: "Alex Deschamps",
  password: "123",
  email: "alex@gmail.com",
  provider_id: 1,
  birthday: 1981/20/10,
gender: 'male')

# b1 = provider1.boards.create(title: 'Workout')
# b2 = provider1.boards.create(title: 'Crossfit')
# b3 = provider1.boards.create(title: 'Bouncy')

# c1 = b1.cards.create(title: 'squats', description: 'feel the burn')
# c2 = b1.cards.create(title: 'pushups', description: 'ooh ouch')
# c3 = b2.cards.create(title: 'situps', description: 'ouchy')

# c4 = b2.cards.create(title: 'squats', description: 'feel the burn')
# c5 = b2.cards.create(title: 'pushups', description: 'ooh ouch')
# c6 = b2.cards.create(title: 'situps', description: 'ouchy')

# c7 = b3.cards.create(title: 'squats', description: 'feel the burn')
# c8 = b3.cards.create(title: 'pushups', description: 'ooh ouch')
# c9 = b3.cards.create(title: 'situps', description: 'ouchy')

# l1 = c1.likes.create(done: false, consumer_id: '1')
# l2 = c3.likes.create(done: true, consumer_id: '1')
# l3 = c4.likes.create(done: true, consumer_id: '2')

# # b1.viewers = [consumer1, consumer2]

