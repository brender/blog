class AddThumbnailToPosts < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :thumbnail
  end

  def self.down
    remove_attachment :posts, :thumbnail
  end
end
