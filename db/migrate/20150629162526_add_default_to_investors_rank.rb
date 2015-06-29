class AddDefaultToInvestorsRank < ActiveRecord::Migration
  def change
    change_column :investors, :rank, :integer, :default => 1
  end
end
