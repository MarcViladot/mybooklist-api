class Review < ApplicationRecord

	belongs_to :user
	belongs_to :book

	validates_uniqueness_of :book_id, scope: :user_id

	has_many :review_votes
	has_many :users, through: :review_votes

end
