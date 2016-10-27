# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create({name:"toy"})
Category.create({name:"food"})
Category.create({name:"cloth"})

# create user
30.times do
  user=User.new
  user.first_name=Faker::Name.name
  user.last_name=Faker::Name.name
  user.email=Faker::Internet.email
  user.password_digest=BCrypt::Password.create("123456")
  user.save

end

400.times do
  p=Product.new()
  p.title=Faker::Name.name             #=> "Tyshawn Johns Sr."
  p.description=Faker::Lorem.word #=> "repellendus"
  p.price=rand(1000)
  p.category=Category.all.sample
  p.user=User.all.sample
  p.save

end

50.times do
  r=Review.new
  r.body=Faker::Lorem.sentence
  r.star_count=rand(5)
  r.product= Product.all.sample
  r.user=User.all.sample
  r.save

end




