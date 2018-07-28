class AddBookToAuthorBook < ActiveRecord::Migration[5.1]
  def change
    add_reference :authorbooks, :book, foreign_key: true
  end
end
