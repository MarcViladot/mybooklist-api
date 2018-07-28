class Genre < ApplicationRecord

	has_many :genrebooks
	has_many :books , through: :genrebooks

end
