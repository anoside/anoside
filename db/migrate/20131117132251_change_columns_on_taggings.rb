class ChangeColumnsOnTaggings < ActiveRecord::Migration
  def change
    remove_column :taggings, :taggable_id
    remove_column :taggings, :taggable_type
    remove_column :taggings, :tagger_id
    remove_column :taggings, :tagger_type
    remove_column :taggings, :context

    add_column    :taggings, :post_id, :integer, null: false, after: :id
    change_column :taggings, :tag_id, :integer, null: false
    add_index     :taggings, :post_id
    add_index     :taggings, [:post_id, :tag_id], unique: true
  end
end
