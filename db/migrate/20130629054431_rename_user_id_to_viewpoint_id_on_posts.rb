class RenameUserIdToViewpointIdOnPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :user_id, :viewpoint_id
    remove_index :posts, :author_id
    add_index :posts, :viewpoint_id
  end
end
