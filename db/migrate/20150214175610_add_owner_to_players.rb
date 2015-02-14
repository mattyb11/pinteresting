class AddOwnerToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :owner, :string
  end
end
