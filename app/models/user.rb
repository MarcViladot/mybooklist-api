class User < ApplicationRecord

	has_many :reviews
	has_many :books , through: :reviews

	has_many :addeds
	has_many :books , through: :addeds

	has_many :favbooks
	has_many :books , through: :favbooks

	has_many :favauthors
	has_many :authors , through: :favauthors


	has_secure_password

	validates_presence_of :email
	validates_uniqueness_of :email, case_sensitive: false
	validates_format_of :email, with: /@/
	validates :username, presence: true, uniqueness: true

end
