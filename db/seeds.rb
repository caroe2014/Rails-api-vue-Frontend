# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.destroy_all
Record.destroy_all

mj = Artist.create!(name: "Michael Jackson")
tfc = Artist.create!(name: "Thousand Foot Krutch")
ng = Artist.create!(name: "Nathalie Grant")
jc = Artist.create!(name: "Jeremy Camp")
bd = Artist.create!(name: "Big Daddy")
sf = Artist.create!(name: "SwithFoot")






