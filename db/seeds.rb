# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1000.times do
  p=Product.new()
  p.title=Faker::Name.name             #=> "Tyshawn Johns Sr."
  p.description=Faker::Lorem.word #=> "repellendus"
  p.price=rand(1000)
  p.save




end