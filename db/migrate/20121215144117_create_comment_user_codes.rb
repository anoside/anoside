class CreateCommentUserCodes < ActiveRecord::Migration
  def change
    create_table :comment_user_codes do |t|
      t.references :post, null: false
      t.references :user, null: false
      t.string :code, null: false
      t.timestamps
    end
 
    add_index :comment_user_codes, :code, unique: true
    add_index :comment_user_codes, :post_id
    add_index :comment_user_codes, :user_id
    add_index :comment_user_codes, [:post_id, :user_id], unique: true
  end
end
