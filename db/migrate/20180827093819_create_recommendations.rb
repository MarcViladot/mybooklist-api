class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.text :reasons
      t.integer 'recommended_id', :null => false
      t.integer 'recommending_id', :null => false

      t.timestamps
    end
    add_index :recommendations, :recommended_id
    add_index :recommendations, :recommending_id
  end
end
