class AddAuthorToAuthorbook < ActiveRecord::Migration[5.1]
  def change
    add_reference :authorbooks, :author, foreign_key: true
  end
end
