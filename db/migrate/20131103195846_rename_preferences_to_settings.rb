class RenamePreferencesToSettings < ActiveRecord::Migration
  def change
    rename_table 'preferences', 'settings'
    rename_table 'languages_preferences', 'languages_settings'

    remove_column :languages_settings, :preference_id
    add_column    :languages_settings, :setting_id, :integer, null: false, after: :language_id
    add_index     :languages_settings, :setting_id
  end
end
