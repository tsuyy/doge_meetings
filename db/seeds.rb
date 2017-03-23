# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Invite.delete_all
Playdate.delete_all
Dog.delete_all
User.delete_all

doge = User.create({
	name: "Doge",
	email: "d@d.com",
	password: "123",
	city: "San Francisco"
	})
kody = User.create({
	name: "Kody",
	email: "k@l.com",
	password: "123",
	city: "San Francisco"
	})
yvonne = User.create({
	name: "Yvonne",
	email: "y@t.com",
	password: "123",
	city: "San Francisco"
	})
regelyn = User.create({
	name: "Regelyn",
	email: "r@c.com",
	password: "123",
	city: "San Francisco"
	})

