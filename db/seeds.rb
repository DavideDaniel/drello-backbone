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
  birthday: '1981/20/10')

consumer2 = Consumer.create(
  name: "Alex Deschamps",
  password: "123",
  email: "alex@gmail.com",
  provider_id: 1,
  birthday: '1981/20/10')

b1 = provider1.boards.create(title: 'Diabetes')
b2 = provider1.boards.create(title: 'Heart-disease')
b3 = provider1.boards.create(title: 'Excercise')

l1 = b1.lists.create(title: 'todo')
l2 = b1.lists.create(title: 'doing')
l3 = b1.lists.create(title: 'done')

c1 = l3.cards.create(title: 'eat better', description: 'feel better')
c2 = l3.cards.create(title: 'excercise', description: 'feel even better')
c3 = l3.cards.create(title: 'relax', description: 'get rest')

c4 = l1.cards.create(title: 'eat better', description: 'feel better')
c5 = l1.cards.create(title: 'excercise', description: 'feel even better')
c6 = l1.cards.create(title: 'relax', description: 'get rest')

c7 = l2.cards.create(title: 'eat better', description: 'feel better')
c8 = l2.cards.create(title: 'excercise', description: 'feel even better')
c9 = l2.cards.create(title: 'relax', description: 'get rest')

l1 = c1.likes.create(done: false, consumer_id: '1')
l2 = c3.likes.create(done: true, consumer_id: '1')
l3 = c4.likes.create(done: true, consumer_id: '2')

b1.viewers = [consumer1, consumer2]
b1.save



