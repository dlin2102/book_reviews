# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Book.destroy_all
Review.destroy_all

users = User.create([
  {email:"clin2102@yahoo.com", password:"danlin77"},
  {email: "dlin2102@gmail.com", password:"danlin77"}
])

categories = Category.create([
  {name:"Romance"},
  {name:"Children's Books"},
  {name:"Young Adult"},
  {name:"Fiction"},
  {name:"Fantasy"},
  {name:"Triller"},
  {name:"Cookbooks"},
  {name:"Art"},
  {name:"Technology"},
  {name:"Biographies"},
  {name:"History"}
  ])

  
