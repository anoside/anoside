class AddLikesCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes_count, :integer, default: 0, after: :comments_count
  end
end
