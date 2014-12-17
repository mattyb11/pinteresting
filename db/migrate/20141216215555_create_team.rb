class CreateTeam < ActiveRecord::Migration
  def change
    drop_table :tea

    create_table :team do |t|
      t.integer :ranking
      t.string :name
      t.string :position

      t.timestamps
    end
  end
end
