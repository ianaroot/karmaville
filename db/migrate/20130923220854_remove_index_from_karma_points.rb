class RemoveIndexFromKarmaPoints < ActiveRecord::Migration
  def up
    remove_index :users, :id
  end

  def down
    add_index :users, :id
  end
end
