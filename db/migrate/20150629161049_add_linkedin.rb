class AddLinkedin < ActiveRecord::Migration
  def change
    add_column :investors, :linkedin, :string
  end
end
