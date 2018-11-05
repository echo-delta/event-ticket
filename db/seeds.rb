# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Events
events = Event.create([
	{
		name: 'Event 1',
		description: 'Event 1 description'
	},
	{
		name: 'Event 2',
		description: 'Event 2 description'
	}
])

# Seed Tickets
events.each do |event| 
	event.tickets.create
end