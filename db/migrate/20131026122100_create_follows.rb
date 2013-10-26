class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id, null: false
      t.integer :tag_id,  null: false
      t.timestamps
    end

    add_index :follows, :tag_id
    add_index :follows, :user_id
    add_index :follows, [:tag_id, :user_id], unique: true
  end
end
