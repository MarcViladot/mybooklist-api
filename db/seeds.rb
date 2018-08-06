# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan posuere justo quis sagittis. Quisque tempus tellus dui, finibus porta nisl placerat sed. Etiam sed tincidunt mi. Suspendisse aliquam nisi eget velit gravida, eu laoreet quam mattis. Proin vitae volutpat magna. Fusce porta vel lectus quis aliquet. Integer nunc lorem, elementum quis tellus ut, rhoncus fringilla purus. Mauris lacinia urna lacinia dolor sollicitudin, quis egestas nunc venenatis. Aliquam quis nunc sollicitudin purus aliquam molestie quis non tortor. Aenean auctor elit ut interdum pretium. Sed condimentum lacus nec lectus ultrices, sit amet iaculis ligula ultrices. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque vehicula volutpat nulla, et commodo justo vestibulum sed. Vestibulum vitae convallis sapien."
loremHtml = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sit amet mi id mauris ornare fermentum. Nam elit leo, pretium in sem eget, maximus venenatis lectus. Maecenas sagittis et purus vel pretium. Mauris id nisi condimentum, volutpat eros eu, fringilla justo. Phasellus tincidunt lacinia odio, quis rutrum nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec pharetra ultrices fermentum. Cras arcu felis, ullamcorper non eros et, auctor ultricies mi.</p>
<p>Maecenas sollicitudin elementum ante, eget consectetur felis. Sed et suscipit mauris, vitae tempus velit. Fusce nisi metus, suscipit tincidunt pretium in, aliquam id orci. Sed vel risus aliquam, gravida urna nec, sollicitudin tortor. Vivamus dictum odio eu est feugiat, id tincidunt est dictum. Praesent ac elit egestas orci semper suscipit quis in odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean finibus orci at quam accumsan ultrices. Integer ac tortor a ipsum convallis hendrerit id non ligula. Nullam tincidunt massa vel odio hendrerit accumsan. Vestibulum ac turpis lobortis, aliquam velit et, tincidunt massa.</p>"
added_status = ["Reading", "Completed", "On-hold", "Dropped", "Plan to Read"]

10.times do
	Author.create({name: Faker::Book.unique.author, born:rand(1940..1990).to_s + '-01-01'})
end

15.times do
	Genre.create({genre:Faker::Book.unique.genre})
end

10.times do
	Serie.create({name:Faker::Zelda.unique.location})
end

40.times do
	Book.create({name:Faker::Book.unique.title, plot:lorem, year:rand(1990..2018), lang:'gb', pages:rand(200..1300), form:'novel', serie_id:rand(1..10), cover:'https://picsum.photos/405/600/?image=' + (rand(200).to_s)})
end

1.upto(40) do |i|
	Authorbook.create({author_id:rand(1..10), book_id:i})
end

1.upto(40) do |i|
	rand(1..5).times do
		Genrebook.create({genre_id:rand(1..15), book_id:i})
	end
end

5.times do
	User.create({username:Faker::OnePiece.unique.character, email:Faker::Internet.free_email, role:rand(1), status:1, password:'12345', password_confirmation:'12345'})
end

400.times do
	Added.create({status:added_status.sample, progress:rand(200), score:rand(1..10), user_id:rand(1..5), book_id:rand(rand(1..40))})
end

1.upto(5) do |i|
	rand(1..5).times do
		Favbook.create({user_id:i, book_id:rand(1..40)})
	end
end

1.upto(5) do |i|
	rand(1..5).times do
		Favauthor.create({user_id:i, author_id:rand(1..10)})
	end
end

150.times do
	Review.create({text:loremHtml, score:rand(1..10), user_id:rand(1..5), book_id:rand(1..40)})
end
