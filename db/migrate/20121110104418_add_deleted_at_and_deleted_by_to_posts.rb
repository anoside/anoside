class AddDeletedAtAndDeletedByToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :deleted_by, :string, after: :body
    add_column :posts, :deleted_at, :datetime, after: :updated_at
  end
end
