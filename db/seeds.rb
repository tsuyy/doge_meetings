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
	sex: "Male"
	breed: "Shiba Inu",
	vaccinated: true,
	neutered: true,
	weight: 20,
	image: "https://68.media.tumblr.com/avatar_0931a62de37a_128.png"
	temperament: "confused"
	})
ein = Dog.create({
	name: "Ein",
	age: 3,
	sex: "Male"
	breed: "Corgi",
	vaccinated: true,
	neutered: true,
	weight: 18,
	image: "https://68.media.tumblr.com/avatar_0931a62de37a_128.png"
	temperament: "playful"
	})
apollo = Dog.create({
	name: "Apollo",
	age: 3,
	sex: "Male"
	breed: "Labrador",
	vaccinated: true,
	neutered: true,
	weight: 27,
	image: "https://68.media.tumblr.com/avatar_0931a62de37a_128.png"
	temperament: "hangry"
	})
koda = Dog.create({
	name: "Koda",
	age: 1,
	sex: "Male"
	breed: "German Shepherd",
	vaccinated: true,
	neutered: true,
	weight: 25,
	image: "https://68.media.tumblr.com/avatar_0931a62de37a_128.png"
	temperament: "destructive"
	})

koda_pals = Playdate.create({
	title: "Koda Needs A Friend",
	location: "Mission Bay Dog Park"
	date: Date.new(), 
	description: "My dog is lonely and needs a friend cuz he's bored at home, so he destroys everything."
	})
ein_pals = Playdate.create({
	title: "Ein Adventures",
	location: "Golden Gate Park"
	date: Date.new(), 
	description: "Ein wants a pal to go on a space adventure!"
	})
foo_pals = Playdate.create({
	title: "Looking For A Buddy",
	location: "Duboce Park"
	date: Date.new(), 
	description: "Need a play buddy!"
	})
apollo_pals = Playdate.create({
	title: "Save My Dog From Boredom",
	location: "Rincon Hill Dog Park"
	date: Date.new(), 
	description: "My dog is bored..."
	})