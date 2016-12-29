class AddAttachmentPassportImageToPilgrims < ActiveRecord::Migration
  def self.up
    change_table :pilgrims do |t|
      t.attachment :passport_image
    end
  end

  def self.down
    remove_attachment :pilgrims, :passport_image
  end
end
