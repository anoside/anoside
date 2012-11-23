class RenameReferenceIdInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :author_id, :user_id
  end
end
