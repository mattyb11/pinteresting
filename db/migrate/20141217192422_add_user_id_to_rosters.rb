class AddUserIdToRosters < ActiveRecord::Migration
  def change
    add_column :rosters, :user_id, :integer
  end
end
