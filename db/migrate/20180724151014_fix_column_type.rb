class FixColumnType < ActiveRecord::Migration[5.1]
  def change
  	rename_column :books, :type, :form
  end
end
