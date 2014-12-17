class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :ranking
      t.string :name
      t.string :position

      t.timestamps
    end
  end
end
