class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer :user_id,      null: false
      t.integer :dislikable_id,   null: false
      t.string  :dislikable_type, null: false
      t.timestamps
    end

    add_index :dislikes, :user_id
    add_index :dislikes, [:dislikable_id, :dislikable_type]
    add_index :dislikes, [:user_id, :dislikable_id, :dislikable_type], unique: true
  end
end
