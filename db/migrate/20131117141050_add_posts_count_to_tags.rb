class AddPostsCountToTags < ActiveRecord::Migration
  def change
    add_column :tags, :posts_count, :integer, null: false, default: 0
    add_index  :tags, :posts_count
  end
end
