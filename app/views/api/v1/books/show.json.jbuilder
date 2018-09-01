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


json.reviews do 
	json.array!(@book.reviews.sort_by{|o| o.review_votes.count.to_i}.reverse!) do |review|
		json.(review, :id, :text, :score, :created_at)
		json.upvotes review.review_votes.count.to_i
		json.upvoted false
		review.review_votes.each do |vote|
			json.upvoted true if vote.user.id == @current_user.id
		end
		json.user do 
			json.(review.user, :id, :username, :avatar)
		end
	end
end

json.recommendations @book.recommendations do |recommendation|
	json.recommended do 
		json.(recommendation.recommended, :id, :name, :cover)
	end
	json.recommending do 
		json.(recommendation.recommending, :id, :name, :cover)
	end
	json.user do 
		json.(recommendation.user, :id, :username)
	end
	json.(recommendation, :reasons, :created_at)
end

# json.recommendations do
# 	json.array!(@book.recommendings.sort_by{|o| o.addeds.average(:score).to_f}.reverse!) do |b|
# 		json.(b, :id, :cover, :name)
# 	end
# end


