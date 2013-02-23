class AddCommentsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer, default: 0, null: false, after: :deleted_by

    add_index :posts, :comments_count
  end
end
