class AddAttachmentImageToScans < ActiveRecord::Migration
  def self.up
    change_table :scans do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :scans, :image
  end
end
