class AddRelativeIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :relative_id, :integer, null: false, after: :id
  end
end
