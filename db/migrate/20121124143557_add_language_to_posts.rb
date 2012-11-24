class AddLanguageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :language, :string, null: false, after: :body

    add_index :posts, :language
  end
end
