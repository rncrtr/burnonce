class AddBurnEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :burn_email, :string
    add_index :users, :burn_email, unique: true
  end
end
