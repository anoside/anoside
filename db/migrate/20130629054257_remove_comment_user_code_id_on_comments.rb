class RemoveCommentUserCodeIdOnComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment_user_code_id
  end
end
