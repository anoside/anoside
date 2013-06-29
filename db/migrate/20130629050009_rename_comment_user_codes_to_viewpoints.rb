class RenameCommentUserCodesToViewpoints < ActiveRecord::Migration
  def change
    rename_table :comment_user_codes, :viewpoints
  end
end
