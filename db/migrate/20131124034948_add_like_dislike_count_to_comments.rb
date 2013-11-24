class AddLikeDislikeCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :likes_count,    :integer, null: false, default: 0, after: :body
    add_column :comments, :dislikes_count, :integer, null: false, default: 0, after: :likes_count
  end
end
