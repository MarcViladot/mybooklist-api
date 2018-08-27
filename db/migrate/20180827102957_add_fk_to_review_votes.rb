class AddFkToReviewVotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :review_votes, :user, foreign_key: true
    add_reference :review_votes, :review, foreign_key: true
  end
end
