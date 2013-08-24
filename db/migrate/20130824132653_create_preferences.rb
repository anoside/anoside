class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :user_id, null: false
      t.boolean :email_when_commented, default: true, null: false
      t.timestamps
    end

    add_index :preferences, :user_id, unique: true
  end
end
