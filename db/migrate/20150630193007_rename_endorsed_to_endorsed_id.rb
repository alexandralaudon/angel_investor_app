class RenameEndorsedToEndorsedId < ActiveRecord::Migration
  def change
    rename_column :endorsements, :endorsed, :endorsed_id
  end
end
