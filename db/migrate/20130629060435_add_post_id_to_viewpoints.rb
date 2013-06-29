class AddPostIdToViewpoints < ActiveRecord::Migration
  def change
    add_column :viewpoints, :post_id, :integer, null: false, after: :user_id
    add_index :viewpoints, :post_id
    add_index :viewpoints, [:user_id, :post_id], unique: true
  end
end
