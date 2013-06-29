class RemoveViewpointIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :viewpoint_id
  end
end
