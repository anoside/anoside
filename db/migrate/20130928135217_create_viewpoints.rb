class CreateViewpoints < ActiveRecord::Migration
  def change
    create_table :viewpoints do |t|
      t.integer  :user_id,    null: false
      t.integer  :post_id,    null: false
      t.string   :code,       null: false
      t.boolean  :original,   null: false, default: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    add_index :viewpoints, :code,                unique: true
    add_index :viewpoints, :post_id
    add_index :viewpoints, [:user_id, :post_id], unique: true
    add_index :viewpoints, :user_id
  end
end
