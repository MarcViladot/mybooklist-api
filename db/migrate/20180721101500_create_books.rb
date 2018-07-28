class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.text :plot
      t.date :year
      t.string :lang
      t.integer :pages
      t.string :type

      t.timestamps
    end
  end
end
