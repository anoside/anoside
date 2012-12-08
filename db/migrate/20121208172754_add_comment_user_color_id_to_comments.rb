class AddCommentUserColorIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_user_color_id, :integer, null: false, after: :post_id

    add_index :comments, :comment_user_color_id
  end
end
