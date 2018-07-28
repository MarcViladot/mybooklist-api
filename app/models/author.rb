class Author < ApplicationRecord

	has_many :authorbooks
	has_many :books , through: :authorbooks

	has_many :favauthors
	has_many :users , through: :favauthors

end
