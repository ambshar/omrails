class AddAttachmentImageToShares < ActiveRecord::Migration
  def self.up
    change_table :shares do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :shares, :image
  end
end
