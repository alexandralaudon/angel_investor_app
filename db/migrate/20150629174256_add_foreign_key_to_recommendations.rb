class AddForeignKeyToRecommendations < ActiveRecord::Migration
  def change
    add_index :recommendations, :investor_id
  end
end
