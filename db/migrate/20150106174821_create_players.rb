class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player
      t.string :position
      t.integer :overall_ranking
      t.integer :positional_ranking

      t.timestamps
    end
  end
end
