class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username, null: false, default: ''
      t.string :email
      t.string :encrypted_password, null: false, default: ''
      t.string :reset_password_token
      t.integer :sign_in_count, default: 0
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
