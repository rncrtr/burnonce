class AddLastBurnToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_burn, :datetime
  end
end
