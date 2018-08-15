class ChangeColumnFromUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :role, :boolean, :default => false
  	remove_column :users, :status
  end
end
