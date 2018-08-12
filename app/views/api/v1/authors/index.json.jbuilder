json.authors @authors do |author|
  json.extract! author, :id, :name, :born, :photo, :biography
  json.popularity author.favauthors.count.to_i
  json.total_books author.authorbooks.count.to_i
end