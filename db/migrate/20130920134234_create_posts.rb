class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :language, null: false, default: 1
      t.string :title, null: false
      t.text :body, null: false
      t.string :deleted_by
      t.integer :comments_count, null: false, default: 0
      t.timestamps
      t.datetime :deleted_at
    end

    add_index :posts, :language_id
    add_index :posts, :comments_count
  end
end
