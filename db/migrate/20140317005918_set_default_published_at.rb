class SetDefaultPublishedAt < ActiveRecord::Migration
  def up
    Post.all.each do |post|
      if post.published and post.published_at == nil
        post.update_attributes!(:published_at => post.created_at)
      end
    end
  end

  def down
  end
end
