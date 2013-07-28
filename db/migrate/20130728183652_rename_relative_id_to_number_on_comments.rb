class RenameRelativeIdToNumberOnComments < ActiveRecord::Migration
  def change
    remove_column :comments, :relative_id
    add_column :comments, :number, :integer, null: false, after: :post_id
  end
end
