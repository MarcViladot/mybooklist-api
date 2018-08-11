class Authorbook < ApplicationRecord

	belongs_to :author
	belongs_to :book

	validates_uniqueness_of :author_id, scope: :book_id
	
end
