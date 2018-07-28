class CreateAddeds < ActiveRecord::Migration[5.1]
  def change
    create_table :addeds do |t|
      t.string :status
      t.integer :score
      t.integer :progress

      t.timestamps
    end
  end
end
