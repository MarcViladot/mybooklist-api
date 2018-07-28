class FixColumnYear < ActiveRecord::Migration[5.1]
  def change
  	change_column :books, :year, :integer
  end
end
