class CreateReviewVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :review_votes do |t|

      t.timestamps
    end
  end
end
