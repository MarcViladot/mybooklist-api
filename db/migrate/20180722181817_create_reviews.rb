class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :text
      t.integer :score
      t.integer :votes

      t.timestamps
    end
  end
end
