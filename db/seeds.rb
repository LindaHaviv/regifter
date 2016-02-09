# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.find_or_create_by(title: "Home Goods")
Category.find_or_create_by(title: "Clothing")
Category.find_or_create_by(title: "Electronics")
Category.find_or_create_by(title: "Collectibles")
Category.find_or_create_by(title: "Food")
Category.find_or_create_by(title: "Toys")
Category.find_or_create_by(title: "Other")