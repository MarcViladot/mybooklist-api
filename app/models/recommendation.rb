class Recommendation < ApplicationRecord

	belongs_to :recommended, foreign_key: 'recommended_id', class_name: 'Book'
  	belongs_to :recommending, foreign_key: 'recommending_id', class_name: 'Book'

	belongs_to :user

	validates_uniqueness_of :recommended_id, scope: :user_id
end
