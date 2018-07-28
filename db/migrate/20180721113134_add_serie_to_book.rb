class AddSerieToBook < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :serie, foreign_key: true
  end
end
