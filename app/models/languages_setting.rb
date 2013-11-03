class LanguagesSetting < ActiveRecord::Base
  belongs_to :language
  belongs_to :setting
end
