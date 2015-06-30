class RemoveIndexOnEndorsements < ActiveRecord::Migration
  def change
    remove_index :endorsements, column: :investor_id
  end
end
