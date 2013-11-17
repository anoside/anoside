class RemoveNullPermissionFromNameOnTags < ActiveRecord::Migration
  def change
    change_column :tags, :name, :string, null: false
    add_index     :tags, :name, unique: true
  end
end
