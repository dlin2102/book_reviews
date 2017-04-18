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

  books = Book.create([{title: "Graceling", author: "Kristin Cashore", description: "", created_at: "2017-03-01 14:13:17", updated_at: "2017-03-01 14:13:17", user_id: 2, category_id: 2, book_img_file_name: "Graceling_cover.png", book_img_content_type: "image/png", book_img_file_size: 398359, book_img_updated_at: "2017-03-01 14:13:17"},
    {title: "Matilda", author: "Roald Dahl", description: "Matilda is a sweet, exceptional young girl, but her parents think she's just a nuisance. She expects school to be different but there she has to face Miss Trunchbull, a kid-hating terror of a headmistress. When Matilda is attacked by the Trunchbull she suddenly discovers she has a remarkable power with which to fight back. It'll take a superhuman genius to give Miss Trunchbull what she deserves and Matilda may be just the one to do it!", created_at: "2017-02-27 20:23:42", updated_at: "2017-02-28 14:06:27", user_id: 1, category_id: 8, book_img_file_name: "../app/assets/images/matilda.jpg", book_img_content_type: "image/jpeg", book_img_file_size: 54337, book_img_updated_at: "2017-02-28 14:06:26"},
    {title: "Charlie and the Chocolate Factory", author: "Roald Dahl", description: "", created_at: "2017-02-27 20:22:37", updated_at: "2017-02-28 14:10:03", user_id: 1, category_id: 8, book_img_file_name: "Charliechocolate.jpg", book_img_content_type: "image/jpeg", book_img_file_size: 39242, book_img_updated_at: "2017-02-28 14:10:03"},
    {title: "The Kite Runner", author: " Khaled Hosseini", description: "", created_at: "2017-02-27 21:07:36", updated_at: "2017-02-28 14:11:30", user_id: 2, category_id: 7, book_img_file_name: "kite_runner.jpg", book_img_content_type: "image/jpeg", book_img_file_size: 43773, book_img_updated_at: "2017-02-28 14:11:30"},
    {title: "Great Gatsby", author: "F. Scott Fitzgerald", description: "", created_at: "2017-02-28 15:11:44", updated_at: "2017-02-28 15:18:28", user_id: 2, category_id: 7, book_img_file_name: "TheGreatGatsby_1925jacket.jpeg", book_img_content_type: "image/jpeg", book_img_file_size: 78480, book_img_updated_at: "2017-02-28 15:18:28"},
    {title: "The Hobbit", author: "J. R. R. Tolkien ", description: "", created_at: "2017-03-01 14:14:47", updated_at: "2017-03-01 14:16:07", user_id: 2, category_id: 2, book_img_file_name: "hobbit.jpg", book_img_content_type: "image/jpeg", book_img_file_size: 19508, book_img_updated_at: "2017-03-01 14:16:07"},
    {title: "The Hunger Games", author: "Suzanne Collins", description: "", created_at: "2017-03-01 14:23:12", updated_at: "2017-03-01 14:23:12", user_id: 2, category_id: 1, book_img_file_name: "HungergamesCover.jpg", book_img_content_type: "image/jpeg", book_img_file_size: 278074, book_img_updated_at: "2017-03-01 14:23:11"},
    {title: "Catching Fire", author: "Suzanne Collins", description: "", created_at: "2017-03-01 14:25:51", updated_at: "2017-03-01 14:25:51", user_id: 2, category_id: 1, book_img_file_name: "catchingfire.jpg", book_img_content_type: "image/jpeg", book_img_file_size: 152398, book_img_updated_at: "2017-03-01 14:25:51"},
    {title: "Gone Girl", author: "Gillian Flynn ", description: "", created_at: "2017-03-01 14:32:51", updated_at: "2017-03-01 14:32:51", user_id: 2, category_id: 4, book_img_file_name: "gone_girl.jpg", book_img_content_type: "image/jpeg", book_img_file_size: 29998, book_img_updated_at: "2017-03-01 14:32:50"},
    {title: "The Silence of the Lambs (Hannibal Lecter)", author: "Thomas Harris", description: "", created_at: "2017-03-01 14:34:26", updated_at: "2017-03-01 14:34:26", user_id: 2, category_id: 4, book_img_file_name: "silence_of_lambs.jpg", book_img_content_type: "image/jpeg", book_img_file_size: 33677, book_img_updated_at: "2017-03-01 14:34:26"}
  ])
