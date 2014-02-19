class AddPublishedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :published, :boolean, default: false, null: false
  end
end
