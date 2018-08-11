class AddColumnToAuthor2 < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :biography, :text
  end
end
