json.extract! @user, :id, :username, :avatar, :born, :gender, :created_at
json.following @user.followers.include? @current_user # Current_user follows user
#json.follows @user.following.include? @current_user # User follows Current_user

json.authors @user.authors do |author|
	json.(author, :id, :name, :photo)
end

json.books @user.books do |book|
	json.(book, :id, :name, :cover, :pages, :year)
end

json.recommendations @user.recommendations do |recommendation|
	json.book_recommended do 
		json.(recommendation.recommended, :name, :cover)
	end
	json.book_recommending do 
		json.(recommendation.recommending, :name, :cover)
	end
	json.(recommendation, :reasons)
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