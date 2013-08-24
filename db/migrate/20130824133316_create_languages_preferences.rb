class CreateLanguagesPreferences < ActiveRecord::Migration
  def change
    create_table :languages_preferences do |t|
      t.integer :language_id, null: false
      t.integer :preference_id, null: false
      t.timestamps
    end

    add_index :languages_preferences, :language_id
    add_index :languages_preferences, :preference_id
  end
end
