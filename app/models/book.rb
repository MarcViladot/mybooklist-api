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

end
