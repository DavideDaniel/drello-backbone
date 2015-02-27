# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

provider1 = Provider.create(
	name: "Sharon Chu",
	password_digest: "123",
	email: "sharon@gmail.com",
	trelloName: "daviddaniel6")