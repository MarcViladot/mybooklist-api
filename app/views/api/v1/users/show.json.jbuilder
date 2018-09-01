json.extract! @user, :id, :username, :avatar, :born, :gender, :created_at
json.following @user.followers.include? @current_user # Current_user follows user
#json.follows @user.following.include? @current_user # User follows Current_user

json.authors @user.authors do |author|
	json.(author, :id, :name, :photo)
end

json.books @user.books do |book|
	json.(book, :id, :name, :cover, :pages, :year)
end

json.reviews do 
	json.array!(@user.reviews.sort_by{|o| o.review_votes.count.to_i}.reverse!) do |review|
		json.(review, :id, :text, :score, :created_at)
		json.upvotes review.review_votes.count.to_i
		json.upvoted false
		review.review_votes.each do |vote|
			json.upvoted true if vote.user.id == @current_user.id
		end
		json.book do 
			json.(review.book, :id, :name, :cover)
		end
	end
end

json.recommendations @user.recommendations do |recommendation|
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

json.addeds do
	json.array!(@user.addeds.sort_by{|o| o[:updated_at]}.reverse!) do |added|
	  json.status added.status
	  json.progress added.progress
	  json.score added.score
	  json.update added.updated_at
	  json.percentage added.progress/added.book.pages.to_f*100
	  json.book do
	  	json.(added.book, :id, :name, :cover, :pages)
	  end
	end
end

json.followers @user.followers do |follower|
	json.(follower, :id, :username, :avatar)
end

json.followings @user.following do |following|
	json.(following, :id, :username, :avatar)
end