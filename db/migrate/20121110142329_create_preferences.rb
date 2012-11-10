class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :user, null: false

      t.boolean :email_when_commented, null: false, default: false

      t.timestamps
    end

    add_index :preferences, :user_id, unique: true
  end
end
