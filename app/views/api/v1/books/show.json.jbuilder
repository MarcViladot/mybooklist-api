json.extract! @book, :id, :name, :plot, :year, :lang, :form, :cover, :pages
json.score @book.addeds.average(:score).to_f
json.popularity @book.favbooks.count.to_i
json.serie @book.serie
json.authors @book.authors
json.genres @book.genres

json.reviews @book.reviews do |review|
	json.(review, :id, :text, :score, :created_at)
	json.user do 
		json.(review.user, :id, :username, :avatar)
	end
end
