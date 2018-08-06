class Genrebook < ApplicationRecord

	belongs_to :book
	belongs_to :genre

	validates_uniqueness_of :book_id, scope: :genre_id

end
