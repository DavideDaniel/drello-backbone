# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.create(
	name: "Sharon Chu",
	password: "123",
	email: "sharon@gmail.com",
	trelloName: "daviddaniel6")

Consumer.create(
	name: "Jason Ng",
	password: "123",
	email: "jason@gmail.com",
	provider_id: 1)

Consumer.create(
	name: "Alex Deschamps",
	password: "123",
	email: "alex@gmail.com",
	provider_id: 1)

