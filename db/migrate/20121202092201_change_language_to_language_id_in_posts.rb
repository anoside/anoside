class ChangeLanguageToLanguageIdInPosts < ActiveRecord::Migration
  def change
    remove_index :posts, :language
    rename_column :posts, :language, :language_id
    change_column :posts, :language_id, :integer, null: false, default: 1, after: :user_id
    add_index :posts, :language_id
  end
end
