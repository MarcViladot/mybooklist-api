class CreateFavauthors < ActiveRecord::Migration[5.1]
  def change
    create_table :favauthors do |t|

      t.timestamps
    end
  end
end
