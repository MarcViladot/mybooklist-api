json.extract! @book, :id, :name, :plot, :year, :lang, :form, :cover, :pages
json.score @book.addeds.average(:score).to_f
json.popularity @book.favbooks.count.to_i
json.members @book.addeds.count.to_i
json.authors @book.authors
json.genres @book.genres

if @book.serie != nil
	json.serie do
	  	json.(@book.serie, :id, :name)
	  	json.books @book.serie.books do |book|
	  		json.(book, :id, :name, :cover)
	  	end
	end
end

json.reviews @book.reviews do |review|
	json.(review, :id, :text, :score, :created_at)
	json.user do 
		json.(review.user, :id, :username, :avatar)
	end
end


