class LanguagesPreference < ActiveRecord::Base
  attr_accessible :language_id, :preference_id

  belongs_to :language
  belongs_to :preference
end
