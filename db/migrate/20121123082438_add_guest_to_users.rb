class AddGuestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guest, :boolean, null: false, default: false, after: :encrypted_password

    add_index :users, :guest
  end
end
