class AddOriginalToViewpoints < ActiveRecord::Migration
  def change
    add_column :viewpoints, :original, :boolean, null: false, default: false, after: :code
  end
end
