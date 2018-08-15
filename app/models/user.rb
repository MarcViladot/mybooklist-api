class User < ApplicationRecord

	before_create :confirmation_token

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

	def email_activate
    	self.email_confirmed = true
    	self.confirm_token = nil
    	save!(:validate => false)
  	end

	private
	
	def confirmation_token
    	if self.confirm_token.blank?
        	self.confirm_token = SecureRandom.urlsafe_base64.to_s
      	end
	end

end
