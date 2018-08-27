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

	has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
	has_many :followers, through: :follower_relationships, source: :follower

	has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
	has_many :following, through: :following_relationships, source: :following

	has_many :recommendations

	has_many :review_votes
	has_many :reviews , through: :review_votes

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

  	def follow(user_id)
    	following_relationships.create(following_id: user_id)
  	end

  	def unfollow(user_id)
    	following_relationships.find_by(following_id: user_id).destroy
  	end

	private
	
	def confirmation_token
    	if self.confirm_token.blank?
        	self.confirm_token = SecureRandom.urlsafe_base64.to_s
      	end
	end

end
