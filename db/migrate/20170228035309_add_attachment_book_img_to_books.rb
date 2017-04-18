class AddAttachmentBookImgToBooks < ActiveRecord::Migration
  # Great job setting up your schema to work with paperclip
  def self.up
    change_table :books do |t|
      t.attachment :book_img
    end
  end

  def self.down
    remove_attachment :books, :book_img
  end
end
