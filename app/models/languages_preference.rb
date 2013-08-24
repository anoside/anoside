class LanguagesPreference < ActiveRecord::Base
  belongs_to :language
  belongs_to :preference
end
