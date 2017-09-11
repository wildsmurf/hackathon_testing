class AddAttachmentAvatarToBios < ActiveRecord::Migration[5.0]
  def self.up
    change_table :bios do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :bios, :avatar
  end
end
