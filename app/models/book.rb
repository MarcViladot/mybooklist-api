class Book < ApplicationRecord

	has_many :authorbooks
	has_many :authors , through: :authorbooks

	has_many :genrebooks
	has_many :genres , through: :genrebooks

	has_many :reviews
	has_many :users , through: :reviews

	has_many :addeds
	has_many :users , through: :addeds

	has_many :favbooks
	has_many :users , through: :favbooks

	belongs_to :serie

	has_many :recommended_relationships, foreign_key: :recommended_id, class_name: 'Recommendations'
	has_many :recommendeds, through: :recommended_relationships, source: :recommended

	has_many :recommending_relationships, foreign_key: :recommending_id, class_name: 'Recommendations'
	has_many :recommendings, through: :recommending_relationships, source: :recommending

end
