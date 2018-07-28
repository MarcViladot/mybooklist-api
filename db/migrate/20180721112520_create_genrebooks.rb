class CreateGenrebooks < ActiveRecord::Migration[5.1]
  def change
    create_table :genrebooks do |t|

      t.timestamps
    end
  end
end
