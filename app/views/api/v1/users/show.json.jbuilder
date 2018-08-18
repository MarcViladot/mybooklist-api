json.extract! @user, :id, :username, :avatar
json.follows @user.followers.include? @current_user

json.followers @user.followers do |follower|
	json.(follower, :id, :username, :avatar)
end

json.following @user.following do |following|
	json.(following, :id, :username, :avatar)
end