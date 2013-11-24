class AddLikesDislikesCountIndex < ActiveRecord::Migration
  def change
    add_index :comments, :dislikes_count
    add_index :comments, :likes_count
    add_index :posts,    :dislikes_count
    add_index :posts,    :likes_count
  end
end
