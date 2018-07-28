class AddFkToFavauthor < ActiveRecord::Migration[5.1]
  def change
    add_reference :favauthors, :user, foreign_key: true
    add_reference :favauthors, :author, foreign_key: true
  end
end
