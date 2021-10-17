# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Jerry", username: "iheartpez", password_digest: "pez")

Movie.create(title: "Night Of The Living Dead" )
Movie.create(title: "Evil Dead" )
Movie.create(title: "Evil Dead 2" )
Movie.create(title: "The Lost Boys" )
Movie.create(title: "American Werewolf in London" )
Movie.create(title: "The Craft" )
Movie.create(title: "Halloween" )
Movie.create(title: "Frankenstein" )
Movie.create(title: "They Live" )
Movie.create(title: "Rocky Horror Picture Show" )
Movie.create(title: "Hellboy")


