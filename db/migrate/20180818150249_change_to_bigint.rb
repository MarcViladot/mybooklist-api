class ChangeToBigint < ActiveRecord::Migration[5.1]
  def change
  	change_column :follows, :follower_id, :bigint
  	change_column :follows, :following_id, :bigint
  end
end
