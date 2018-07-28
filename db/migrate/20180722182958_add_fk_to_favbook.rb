class AddFkToFavbook < ActiveRecord::Migration[5.1]
  def change
    add_reference :favbooks, :user, foreign_key: true
    add_reference :favbooks, :book, foreign_key: true
  end
end
