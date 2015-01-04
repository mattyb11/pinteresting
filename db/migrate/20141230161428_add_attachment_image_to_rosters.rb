class AddAttachmentImageToRosters < ActiveRecord::Migration
  def self.up
    change_table :rosters do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :rosters, :image
  end
end
