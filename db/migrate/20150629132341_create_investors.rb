class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.integer :rank

      t.timestamps
    end
  end
end
