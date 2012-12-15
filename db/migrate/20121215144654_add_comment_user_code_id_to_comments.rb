class AddCommentUserCodeIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_user_code_id, :integer, null: false, after: :post_id
 
    add_index :comments, :comment_user_code_id
  end
end
