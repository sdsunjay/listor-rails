class AddAttachmentImageToCandidates < ActiveRecord::Migration
  def self.up
    change_table :candidates do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :candidates, :image
  end
end
