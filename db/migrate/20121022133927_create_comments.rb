class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :author, null: false, default: 0
      t.references :post, null: false

      t.text :body, null: false

      t.timestamps
    end

    add_index :comments, :author_id
    add_index :comments, :post_id
  end
end
