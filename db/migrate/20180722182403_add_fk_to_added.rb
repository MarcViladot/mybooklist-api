class AddFkToAdded < ActiveRecord::Migration[5.1]
  def change
    add_reference :addeds, :user, foreign_key: true
    add_reference :addeds, :book, foreign_key: true
  end
end
