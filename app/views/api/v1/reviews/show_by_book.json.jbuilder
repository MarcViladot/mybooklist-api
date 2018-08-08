json.reviews @reviews do |review|
  json.extract! review, :id, :text, :score, :created_at
  
  json.user do 
  	json.(review.user, :id, :username, :avatar)
  end
  
end