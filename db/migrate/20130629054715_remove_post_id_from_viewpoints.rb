class RemovePostIdFromViewpoints < ActiveRecord::Migration
  def change
    remove_index :viewpoints, name: :index_comment_user_codes_on_post_id_and_user_id
    remove_column :viewpoints, :post_id
  end
end
