class Favauthor < ApplicationRecord

	belongs_to :user
	belongs_to :author

	validates_uniqueness_of :author_id, scope: :user_id
end
