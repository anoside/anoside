class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :author, null: false, default: 0
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end

    add_index :posts, :author_id
  end
end
