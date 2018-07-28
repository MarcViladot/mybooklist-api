class RemoveVotesFromReviews < ActiveRecord::Migration[5.1]
  def change
  	remove_column :reviews, :votes
  end
end
