class ChangeColumnAvatarFromUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :avatar, :string, :default => "https://picsum.photos/200/200/?random"
  end
end
