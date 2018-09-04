json.array!(@books.sort_by{|o| o.addeds.average(:score).to_f}.reverse!) do |book|
  json.extract! book, :id, :name, :plot, :year, :lang, :form, :cover, :pages
  json.score book.addeds.average(:score).to_f
  json.popularity book.favbooks.count.to_i
  json.members book.addeds.count.to_i
  json.serie book.serie
  json.authors book.authors
  json.genres book.genres

  if @current_user != nil
   	book.addeds.each do |added|
  		json.added added if added.user.id == @current_user.id
  	end
  end

end