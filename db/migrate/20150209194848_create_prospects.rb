class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :player
      t.string :position
      t.integer :overall_ranking
      t.integer :positional_ranking
      t.string :college
      t.string :notes

      t.timestamps
    end
  end
end
