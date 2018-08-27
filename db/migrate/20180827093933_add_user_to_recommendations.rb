class AddUserToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_reference :recommendations, :user, foreign_key: true
  end
end
