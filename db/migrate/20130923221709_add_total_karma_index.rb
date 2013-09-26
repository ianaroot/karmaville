class AddTotalKarmaIndex < ActiveRecord::Migration
  def up
    add_index :users, :total_karma
  end

  def down
  end
end
