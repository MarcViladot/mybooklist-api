json.authors @authors do |author|
  json.extract! author, :id, :name, :born
  json.popularity author.favauthors.count.to_i
end