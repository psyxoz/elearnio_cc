# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


bill = Talent.create!(first_name: 'Bill', last_name: 'Gates')
jeff = Talent.create!(first_name: 'Jeff', last_name: 'Bezos')
elon = Talent.create!(first_name: 'Elon', last_name: 'Musk')

course1 = Course.create!(title: 'Test course 1', author: bill)
course1.talents << jeff
course1.talents << elon

course2 = Course.create!(title: 'Test course 2', author: jeff)
course2.talents << bill
course2.talents << elon
