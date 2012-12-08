class CreateLanguagesPreferences < ActiveRecord::Migration
  def change
    create_table :languages_preferences do |t|
      t.references :language, null: false
      t.references :preference, null: false

      t.timestamps
    end

    add_index :languages_preferences, :language_id
    add_index :languages_preferences, :preference_id
  end
end
