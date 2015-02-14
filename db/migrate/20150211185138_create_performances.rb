class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.string :player
      t.string :week
      t.float :points

      t.timestamps
    end

    create_table :player do |t|
    	t.belongs_to :performances, index: true
    end
  end
end
