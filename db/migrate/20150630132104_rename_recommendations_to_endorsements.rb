class RenameRecommendationsToEndorsements < ActiveRecord::Migration
  def change
    rename_table :recommendations, :endorsements
  end
end
