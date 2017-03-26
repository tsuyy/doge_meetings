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

foo = Dog.create({
	name: "Foo",
	age: 2,
	sex: "Male",
	breed: "Shiba Inu",
	vaccinated: true,
	neutered: true,
	weight: 20,
	temperament: "confused",
	user_id: doge.id
})
ein = Dog.create({
	name: "Ein",
	age: 3,
	sex: "Male",
	breed: "Corgi",
	vaccinated: true,
	neutered: true,
	weight: 18,
	temperament: "playful",
	user_id: regelyn.id
})
apollo = Dog.create({
	name: "Apollo",
	age: 3,
	sex: "Male",
	breed: "Labrador",
	vaccinated: true,
	neutered: true,
	weight: 27,
	temperament: "hangry",
	user_id: kody.id
})
koda = Dog.create({
	name: "Koda",
	age: 1,
	sex: "Male",
	breed: "German Shepherd",
	vaccinated: true,
	neutered: true,
	weight: 25,
	temperament: "destructive",
	user_id: yvonne.id
})

koda_pals = Playdate.create({
	title: "Koda Needs A Friend",
	location: "Mission Bay Dog Park",
	date: Date.new(),
	description: "My dog is lonely and needs a friend cuz he's bored at home, so he destroys everything.",
	user_id: yvonne.id
})
ein_pals = Playdate.create({
	title: "Ein Adventures",
	location: "Golden Gate Park",
	date: Date.new(),
	description: "Ein wants a pal to go on a space adventure!",
	user_id: regelyn.id
})
foo_pals = Playdate.create({
	title: "Looking For A Buddy",
	location: "Duboce Park",
	date: Date.new(),
	description: "Need a play buddy!",
	user_id: doge.id
})
apollo_pals = Playdate.create({
	title: "Save My Dog From Boredom",
	location: "Rincon Hill Dog Park",
	date: Date.new(),
	description: "My dog is bored...",
	user_id: kody.id
})

ein_foo = Invite.create ({
	user_id: kody.id,
	playdate_id: ein_pals.id,
	status: 0
})
ein_foo = Invite.create ({
	user_id: regelyn.id,
	playdate_id: ein_pals.id,
	status: 1
})

apollo_koda = Invite.create ({
	user_id: regelyn.id,
	playdate_id: apollo_pals.id,
	status: 0
})
apollo_koda = Invite.create ({
	user_id: kody.id,
	playdate_id: apollo_pals.id,
	status: 1
})

koda_foo = Invite.create ({
	user_id: doge.id,
	playdate_id: koda_pals.id,
	status: 0
})
koda_foo = Invite.create ({
	user_id: yvonne.id,
	playdate_id: koda_pals.id,
	status: 1
})

foo_apollo = Invite.create ({
	user_id: yvonne.id,
	playdate_id: foo_pals.id,
	status: 0
})
foo_apollo = Invite.create ({
	user_id: doge.id,
	playdate_id: foo_pals.id,
	status: 1
})
