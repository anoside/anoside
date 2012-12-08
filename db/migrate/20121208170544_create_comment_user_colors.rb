class CreateCommentUserColors < ActiveRecord::Migration
  def change
    create_table :comment_user_colors do |t|
      t.references :color, null: false
      t.references :post, null: false
      t.references :user, null: false
      t.timestamps
    end

    add_index :comment_user_colors, :color_id
    add_index :comment_user_colors, :post_id
    add_index :comment_user_colors, :user_id
    add_index :comment_user_colors, [:post_id, :user_id], unique: true
  end
end
