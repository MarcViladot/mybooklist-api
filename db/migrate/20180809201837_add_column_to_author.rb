class AddColumnToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :photo, :string
  end
end
