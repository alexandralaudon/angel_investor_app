class RemoveManyColumnsFromRecommendationsTable < ActiveRecord::Migration
  def change
    rename_column :recommendations, :recommend1, :endorsed
    remove_column :recommendations, :recommend2
    remove_column :recommendations, :recommend3
    add_column :recommendations, :comment, :text
  end
end
