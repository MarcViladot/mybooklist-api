json.books @books do |book|
  json.extract! book, :id, :name, :year, :cover, :pages
  json.score book.addeds.average(:score).to_f
  json.members book.addeds.count.to_i
  json.genres book.genres
end