class MoveEmailFromUsersToSettings < ActiveRecord::Migration
  def change
    remove_column :users, :email

    add_column :settings, :email, :string, after: :user_id
    add_index  :settings, :email, unique: true
  end
end
