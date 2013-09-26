class RemoveCompositeIndexFromKarmaPoints < ActiveRecord::Migration
  def up
    remove_index :karma_points, [:user_id, :value]
  end

  def down
    add_index :karma_points, [:user_id, :value]
  end
end
