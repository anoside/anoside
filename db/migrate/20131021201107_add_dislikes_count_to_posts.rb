class AddDislikesCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :dislikes_count, :integer, default: 0, after: :likes_count
  end
end
