class AddReferencesToGenrebooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :genrebooks, :book, foreign_key: true
    add_reference :genrebooks, :genre, foreign_key: true
  end
end
