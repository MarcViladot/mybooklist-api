class CreateAuthorShips < ActiveRecord::Migration[5.1]
  def change
    create_table :author_ships do |t|

      t.timestamps
    end
  end
end
