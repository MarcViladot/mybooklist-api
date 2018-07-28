class CreateFavbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :favbooks do |t|

      t.timestamps
    end
  end
end
