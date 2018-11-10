# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed User
user1 = User.create({
	name: 'Anjing'
})
user1 = User.create({
	name: 'Kucing'
})

# Seed Venues
venue1 = Venue.create({
	name: 'Depan Rumah',
	address: 'Jalan rumah no. 69'
})

# Seed Sections
venue1.sections.create({
	name: 'Selokan1',
	capacity: 1,
	price: 100
})

# Seed Events
event1 = Event.create({
	name: 'Pup',
	description: 'Defekasi massal',
	venue_id: venue1.id
})

# Seed Invoices
user1.invoices.create({
	user_id: user1.id,
	event_id: event1.id,
	is_paid: 1
})
invoice1 = user1.invoices.first

# Seed Booked Sections
invoice1.booked_sections.create({
	section_id: 1
})

# Seed Tickets
invoice1.tickets.create({
	event_id: invoice1.event_id, 
	user_id: invoice1.user_id,
	section_id: 1
})