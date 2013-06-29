class RenameIndexesOnViewpoints < ActiveRecord::Migration
  def change
    rename_index :viewpoints, 'index_comment_user_codes_on_code', 'index_viewpoints_on_code'
    rename_index :viewpoints, 'index_comment_user_codes_on_user_id', 'index_viewpoints_on_user_id'
  end
end
