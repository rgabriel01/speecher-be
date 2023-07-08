# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
users = [
  {
    email: 'lhamilton@foo.com',
    first_name: 'Lewis',
    last_name: 'Hamilton'
  },
  {
    email: 'lnorris@foo.com',
    first_name: 'Lando',
    last_name: 'Norris'
  }
]

users.each do |user|
  User.create(user)
end
