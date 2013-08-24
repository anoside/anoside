class Preference < ActiveRecord::Base
  has_many :languages_preferences
  has_many :languages, through: :languages_preferences
end
