# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

philippine = User.find_or_initialize_by(email:"philippine@gmail.com")
philippine.password = "123456"
philippine.last_name = "von Rochow"
philippine.first_name = "Philippine"
philippine.save!

mario = User.find_or_initialize_by(email:"mario@gmail.com")
mario.password = "123456"
mario.last_name = "Rochow"
mario.first_name = "mario"
mario.save!
