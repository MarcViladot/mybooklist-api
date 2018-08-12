json.extract! @author, :id, :name, :born, :photo, :biography
json.popularity @author.favauthors.count.to_i

json.books @author.books do |book|
	json.(book, :id, :cover, :name, :year, :pages)
	json.score book.addeds.average(:score).to_f
end