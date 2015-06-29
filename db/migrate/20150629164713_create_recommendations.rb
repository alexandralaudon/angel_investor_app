class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :investor_id, :unique => true
      t.integer :recommend1
      t.integer :recommend2
      t.integer :recommend3

      t.timestamps
    end
  end
end
