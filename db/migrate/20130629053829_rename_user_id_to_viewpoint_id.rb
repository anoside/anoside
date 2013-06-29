class RenameUserIdToViewpointId < ActiveRecord::Migration
  def change
    rename_column :comments, :user_id, :viewpoint_id
    remove_index :comments, :author_id
    add_index :comments, :viewpoint_id
  end
end
