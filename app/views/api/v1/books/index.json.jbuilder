json.books @books do |book|
  json.extract! book, :id, :name, :plot, :year, :lang, :form, :cover, :pages
  json.score book.addeds.average(:score).to_f
  json.popularity book.favbooks.count.to_i
  json.serie book.serie
  json.authors book.authors
  json.genres book.genres
end